package com.enomyfinances.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.enomyfinances.entity.SavingsAndInvestments;
import com.enomyfinances.entity.User;
import com.enomyfinances.repository.SavingsAndInvestmentsRepository;

@Service
public class SavingsAndInvestmentsServiceImpl implements SavingsAndInvestmentsService {

	@Autowired
	private SavingsAndInvestmentsRepository investmentsRepository;

	@Override
	public Map<String, Object> calculateInvestment(String investmentType, BigDecimal initialLumpSum,
			BigDecimal monthlyInvestment) {
		Map<String, Object> results = new HashMap<>();

		BigDecimal minReturn, maxReturn, monthlyFee;
		switch (investmentType) {
		case "BSP":
			minReturn = new BigDecimal("0.012");
			maxReturn = new BigDecimal("0.024");
			monthlyFee = new BigDecimal("0.0025");
			validateBasicPlan(initialLumpSum, monthlyInvestment);
			break;
		case "SPP":
			minReturn = new BigDecimal("0.03");
			maxReturn = new BigDecimal("0.055");
			monthlyFee = new BigDecimal("0.003");
			validatePlusPlan(initialLumpSum, monthlyInvestment);
			break;
		case "MSI":
			minReturn = new BigDecimal("0.04");
			maxReturn = new BigDecimal("0.23");
			monthlyFee = new BigDecimal("0.013");
			validateManagedPlan(initialLumpSum, monthlyInvestment);
			break;
		default:
			throw new IllegalArgumentException("Invalid investment type");
		}

		results.putAll(calculateProjection(initialLumpSum, monthlyInvestment, minReturn, maxReturn, monthlyFee, 1));
		results.putAll(calculateProjection(initialLumpSum, monthlyInvestment, minReturn, maxReturn, monthlyFee, 5));
		results.putAll(calculateProjection(initialLumpSum, monthlyInvestment, minReturn, maxReturn, monthlyFee, 10));

		results.put("initialLumpSum", initialLumpSum);
		results.put("monthlyInvestment", monthlyInvestment);
		return results;
	}

	@Override
	public SavingsAndInvestments saveInvestment(User user, String investmentType, BigDecimal initialLumpSum,
			BigDecimal monthlyInvestment, Map<String, Object> calculations) {

		SavingsAndInvestments investment = new SavingsAndInvestments();
		investment.setUser(user);
		investment.setInvestmentType(investmentType);
		investment.setInitialLumpSum(initialLumpSum);
		investment.setMonthlyInvestment(monthlyInvestment);

		investment.setOneYearReturn((BigDecimal) calculations.get("oneYearMax"));
		investment.setFiveYearReturn((BigDecimal) calculations.get("fiveYearMax"));
		investment.setTenYearReturn((BigDecimal) calculations.get("tenYearMax"));
		investment.setTotalProfit((BigDecimal) calculations.get("oneYearMaxProfit"));
		investment.setFeesPaid((BigDecimal) calculations.get("oneYearFees"));
		investment.setTaxesPaid((BigDecimal) calculations.get("oneYearMaxTax"));
		investment.setInvestmentDate(LocalDateTime.now());

		return investmentsRepository.save(investment);
	}

	@Override
	public List<SavingsAndInvestments> getAllInvestments() {
	    return investmentsRepository.findAll();
	}

	private Map<String, Object> calculateProjection(BigDecimal initial, BigDecimal monthly, BigDecimal minReturn,
			BigDecimal maxReturn, BigDecimal monthlyFee, int years) {
		Map<String, Object> projection = new HashMap<>();
		String prefix = years == 1 ? "one" : years == 5 ? "five" : "ten";

		// Calculate total invested amount
		BigDecimal totalMonthlyInvestments = monthly.multiply(BigDecimal.valueOf(12 * years));
		BigDecimal totalInvested = initial.add(totalMonthlyInvestments);

		// Calculate returns with monthly compounding
		BigDecimal minMonthlyRate = minReturn.divide(BigDecimal.valueOf(12), 10, RoundingMode.HALF_UP);
		BigDecimal maxMonthlyRate = maxReturn.divide(BigDecimal.valueOf(12), 10, RoundingMode.HALF_UP);

		BigDecimal minValue = calculateCompoundReturn(initial, monthly, minMonthlyRate, years);
		BigDecimal maxValue = calculateCompoundReturn(initial, monthly, maxMonthlyRate, years);

		// Calculate fees
		BigDecimal fees = calculateFees(initial, monthly, monthlyFee, years);

		// Apply fees
		minValue = minValue.subtract(fees);
		maxValue = maxValue.subtract(fees);

		// Calculate profits
		BigDecimal minProfit = minValue.subtract(totalInvested);
		BigDecimal maxProfit = maxValue.subtract(totalInvested);

		// Calculate taxes
		BigDecimal minTax = calculateTax(minProfit);
		BigDecimal maxTax = calculateTax(maxProfit);

		projection.put(prefix + "YearMin", minValue);
		projection.put(prefix + "YearMax", maxValue);
		projection.put(prefix + "YearFees", fees);
		projection.put(prefix + "YearMinTax", minTax);
		projection.put(prefix + "YearMaxTax", maxTax);
		projection.put(prefix + "YearMinProfit", minProfit);
		projection.put(prefix + "YearMaxProfit", maxProfit);

		return projection;
	}

	private BigDecimal calculateCompoundReturn(BigDecimal initial, BigDecimal monthly, BigDecimal yearlyRate,
			int years) {
		BigDecimal monthlyRate = yearlyRate;
		BigDecimal value = initial;

		for (int month = 0; month < years * 12; month++) {
			// Calculate interest first
			BigDecimal monthlyInterest = value.multiply(monthlyRate);
			value = value.add(monthlyInterest);
			// Add monthly investment after interest
			value = value.add(monthly);
		}

		return value.setScale(2, RoundingMode.HALF_UP);
	}

	private BigDecimal calculateFees(BigDecimal initial, BigDecimal monthly, BigDecimal monthlyFee, int years) {
		BigDecimal totalValue = initial;
		BigDecimal totalFees = BigDecimal.ZERO;

		for (int month = 0; month < years * 12; month++) {
			totalValue = totalValue.add(monthly);
			BigDecimal monthlyFeeAmount = totalValue.multiply(monthlyFee);
			totalFees = totalFees.add(monthlyFeeAmount);
		}

		return totalFees.setScale(2, RoundingMode.HALF_UP);
	}

	private BigDecimal calculateTax(BigDecimal profit) {
		if (profit.compareTo(BigDecimal.ZERO) <= 0) {
			return BigDecimal.ZERO;
		}

		BigDecimal taxFreeAllowance = new BigDecimal("12000");
		BigDecimal basicRateLimit = new BigDecimal("40000");
		BigDecimal basicRate = new BigDecimal("0.10");
		BigDecimal higherRate = new BigDecimal("0.20");

		BigDecimal tax = BigDecimal.ZERO;

		if (profit.compareTo(taxFreeAllowance) <= 0) {
			return tax;
		}

		BigDecimal taxableAtBasic = profit.min(basicRateLimit).subtract(taxFreeAllowance);
		if (taxableAtBasic.compareTo(BigDecimal.ZERO) > 0) {
			tax = tax.add(taxableAtBasic.multiply(basicRate));
		}

		if (profit.compareTo(basicRateLimit) > 0) {
			BigDecimal taxableAtHigher = profit.subtract(basicRateLimit);
			tax = tax.add(taxableAtHigher.multiply(higherRate));
		}

		return tax.setScale(2, RoundingMode.HALF_UP);
	}

	private void validateBasicPlan(BigDecimal initial, BigDecimal monthly) {
		if (monthly.compareTo(new BigDecimal("50")) < 0) {
			throw new IllegalArgumentException("Basic plan requires minimum £50 monthly investment");
		}
	}

	private void validatePlusPlan(BigDecimal initial, BigDecimal monthly) {
		if (initial.compareTo(new BigDecimal("300")) < 0) {
			throw new IllegalArgumentException("Plus plan requires minimum £300 initial investment");
		}
		if (monthly.compareTo(new BigDecimal("50")) < 0) {
			throw new IllegalArgumentException("Plus plan requires minimum £50 monthly investment");
		}
	}

	private void validateManagedPlan(BigDecimal initial, BigDecimal monthly) {
		if (initial.compareTo(new BigDecimal("1000")) < 0) {
			throw new IllegalArgumentException("Managed plan requires minimum £1000 initial investment");
		}
		if (monthly.compareTo(new BigDecimal("150")) < 0) {
			throw new IllegalArgumentException("Managed plan requires minimum £150 monthly investment");
		}
	}

	@Override
    public List<SavingsAndInvestments> findInvestmentsByUser(User user) {
        return investmentsRepository.findByUserOrderByInvestmentDateDesc(user);
    }
}
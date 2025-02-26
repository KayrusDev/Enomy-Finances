package com.enomyfinances.service;

import com.enomyfinances.entity.SavingsAndInvestments;
import com.enomyfinances.entity.User;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface SavingsAndInvestmentsService {
	Map<String, Object> calculateInvestment(String investmentType, BigDecimal initialInvestment,
			BigDecimal monthlyInvestment);

	SavingsAndInvestments saveInvestment(User user, String investmentType, BigDecimal initialInvestment,
			BigDecimal monthlyInvestment, Map<String, Object> calculations);

	List<SavingsAndInvestments> getAllInvestments();

	List<SavingsAndInvestments> findInvestmentsByUser(User user);
	
	
}
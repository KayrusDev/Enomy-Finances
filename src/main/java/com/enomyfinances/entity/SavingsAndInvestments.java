package com.enomyfinances.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "investments")
public class SavingsAndInvestments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "investment_id")
    private Long id;

    @Column(name = "investment_type", nullable = false)
    private String investmentType;

    @Column(name = "monthly_investment", nullable = false)
    private BigDecimal monthlyInvestment;

    @Column(name = "investment_initialumpsum", nullable = false)
    private BigDecimal initialLumpSum;

    @Column(name = "investment_oneyeareturn", nullable = false)
    private BigDecimal oneYearReturn;

    @Column(name = "investment_fiveyeareturn", nullable = false)
    private BigDecimal fiveYearReturn;

    @Column(name = "investment_tenyeareturn", nullable = false)
    private BigDecimal tenYearReturn;

    @Column(name = "total_profit", nullable = false)
    private BigDecimal totalProfit;

    @Column(name = "fees_paid", nullable = false)
    private BigDecimal feesPaid;

    @Column(name = "taxes_paid", nullable = false)
    private BigDecimal taxesPaid;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "investment_date", nullable = false)
    private LocalDateTime investmentDate;

    public SavingsAndInvestments() {
        this.investmentDate = LocalDateTime.now();
    }

	public SavingsAndInvestments(Long id, String investmentType, BigDecimal monthlyInvestment,
			BigDecimal initialLumpSum, BigDecimal oneYearReturn, BigDecimal fiveYearReturn, BigDecimal tenYearReturn,
			BigDecimal totalProfit, BigDecimal feesPaid, BigDecimal taxesPaid, User user,
			LocalDateTime investmentDate) {
		super();
		this.id = id;
		this.investmentType = investmentType;
		this.monthlyInvestment = monthlyInvestment;
		this.initialLumpSum = initialLumpSum;
		this.oneYearReturn = oneYearReturn;
		this.fiveYearReturn = fiveYearReturn;
		this.tenYearReturn = tenYearReturn;
		this.totalProfit = totalProfit;
		this.feesPaid = feesPaid;
		this.taxesPaid = taxesPaid;
		this.user = user;
		this.investmentDate = investmentDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getInvestmentType() {
		return investmentType;
	}

	public void setInvestmentType(String investmentType) {
		this.investmentType = investmentType;
	}

	public BigDecimal getMonthlyInvestment() {
		return monthlyInvestment;
	}

	public void setMonthlyInvestment(BigDecimal monthlyInvestment) {
		this.monthlyInvestment = monthlyInvestment;
	}

	public BigDecimal getInitialLumpSum() {
		return initialLumpSum;
	}

	public void setInitialLumpSum(BigDecimal initialLumpSum) {
		this.initialLumpSum = initialLumpSum;
	}

	public BigDecimal getOneYearReturn() {
		return oneYearReturn;
	}

	public void setOneYearReturn(BigDecimal oneYearReturn) {
		this.oneYearReturn = oneYearReturn;
	}

	public BigDecimal getFiveYearReturn() {
		return fiveYearReturn;
	}

	public void setFiveYearReturn(BigDecimal fiveYearReturn) {
		this.fiveYearReturn = fiveYearReturn;
	}

	public BigDecimal getTenYearReturn() {
		return tenYearReturn;
	}

	public void setTenYearReturn(BigDecimal tenYearReturn) {
		this.tenYearReturn = tenYearReturn;
	}

	public BigDecimal getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(BigDecimal totalProfit) {
		this.totalProfit = totalProfit;
	}

	public BigDecimal getFeesPaid() {
		return feesPaid;
	}

	public void setFeesPaid(BigDecimal feesPaid) {
		this.feesPaid = feesPaid;
	}

	public BigDecimal getTaxesPaid() {
		return taxesPaid;
	}

	public void setTaxesPaid(BigDecimal taxesPaid) {
		this.taxesPaid = taxesPaid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public LocalDateTime getInvestmentDate() {
		return investmentDate;
	}

	public void setInvestmentDate(LocalDateTime investmentDate) {
		this.investmentDate = investmentDate;
	}
   
}
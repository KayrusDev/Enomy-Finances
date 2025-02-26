package com.enomyfinances.service;

import java.util.List;

import com.enomyfinances.entity.CurrencyExchange;
import com.enomyfinances.entity.User;

public interface CurrencyExchangeService {
    CurrencyExchange processExchange(CurrencyExchange currencyExchange);

	List<CurrencyExchange> getAllExchanges();

	List<CurrencyExchange> findExchangesByUser(User user);
    
	
}
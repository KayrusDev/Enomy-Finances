package com.enomyfinances.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.enomyfinances.entity.CurrencyExchange;
import com.enomyfinances.entity.User;

public interface CurrencyExchangeRepository extends JpaRepository<CurrencyExchange, Long> {
	
    List<CurrencyExchange> findByUserOrderByTransactionDateDesc(User user);

	List<CurrencyExchange> findByUserEmail(String userEmail);
}

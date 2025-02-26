package com.enomyfinances.repository;

import com.enomyfinances.entity.SavingsAndInvestments;
import com.enomyfinances.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SavingsAndInvestmentsRepository extends JpaRepository<SavingsAndInvestments, Long> {
    List<SavingsAndInvestments> findByUser(User user);
    List<SavingsAndInvestments> findByUserOrderByInvestmentDateDesc(User user);
	List<SavingsAndInvestments> findByUserEmail(String userEmail);
}

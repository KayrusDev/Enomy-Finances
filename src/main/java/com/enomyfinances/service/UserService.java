package com.enomyfinances.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.enomyfinances.entity.User;

@Service
public interface UserService {

	User registerNewClient(String fname, String lname, String email, String contactNumber, String password);

	boolean emailExists(String email);

	void setPasswordEncoder(PasswordEncoder passwordEncoder);

	User getUserById(Long id);

	User findByEmail(String email);

	List<User> findAllUsers();

}
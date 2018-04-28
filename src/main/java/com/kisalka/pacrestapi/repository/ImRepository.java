package com.kisalka.pacrestapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kisalka.pacrestapi.model.ImModel;

public interface ImRepository extends JpaRepository<ImModel, Integer> {

	ImModel findById(int id);
	
}

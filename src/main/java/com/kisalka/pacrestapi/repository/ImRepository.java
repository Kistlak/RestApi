package com.kisalka.pacrestapi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.kisalka.pacrestapi.model.ImModel;

public interface ImRepository extends JpaRepository<ImModel, Integer> {

	ImModel findById(int id);
	
	DevnameAndOt findAllById(Integer id);
	
	@Query(value = "select id, pname, devname, hrs, ot from api.imaginary", nativeQuery=true)
	List<IdPnameDevnameHrsAndOt> selectAll();
	
}

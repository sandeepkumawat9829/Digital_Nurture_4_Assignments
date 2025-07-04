package com.cognizant.orm_learn.repository;

import com.cognizant.orm_learn.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {}

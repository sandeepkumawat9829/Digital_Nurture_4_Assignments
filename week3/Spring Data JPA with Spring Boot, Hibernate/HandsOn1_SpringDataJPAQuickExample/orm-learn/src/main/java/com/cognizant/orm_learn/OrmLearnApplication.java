// package com.cognizant.orm_learn;

// import java.util.List;
// import com.cognizant.orm_learn.model.Country;
// import com.cognizant.orm_learn.service.CountryService;

// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;

// import org.springframework.boot.SpringApplication;
// import org.springframework.boot.autoconfigure.SpringBootApplication;
// import org.springframework.context.ApplicationContext;

// @SpringBootApplication
// public class OrmLearnApplication {

//     private static final Logger LOGGER = LoggerFactory.getLogger(OrmLearnApplication.class);
//     private static CountryService countryService;

//     public static void main(String[] args) {
//         ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
//         countryService = context.getBean(CountryService.class);
//         testGetAllCountries();
//     }

//     private static void testGetAllCountries() {
//         LOGGER.info("Start");
//         List<Country> countries = countryService.getAllCountries();
//         LOGGER.debug("countries={}", countries);
//         LOGGER.info("End");
//     }
// }


package com.cognizant.orm_learn;

import com.cognizant.orm_learn.model.Department;
import com.cognizant.orm_learn.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OrmLearnApplication implements CommandLineRunner {

    @Autowired
    private DepartmentRepository departmentRepository;

    public static void main(String[] args) {
        SpringApplication.run(OrmLearnApplication.class, args);
    }

    @Override
    public void run(String... args) {
        Department dept = new Department("Engineering");
        departmentRepository.save(dept);
        System.out.println("Department saved with ID: " + dept.getId());
    }
}

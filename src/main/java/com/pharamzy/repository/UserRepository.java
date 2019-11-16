package com.pharamzy.repository;



import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pharamzy.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
	
	@Query(value="Select * from users where u_email=:u_email", nativeQuery = true)
	public User CheckUser(@Param("u_email")String u_email );
}

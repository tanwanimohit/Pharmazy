package com.pharamzy.repository;



import java.util.Set;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pharamzy.models.Products;
@Repository
public interface ProductsRepository extends CrudRepository<Products, Integer> {

	@Query(value="SELECT * FROM `products` where p_name LIKE %:p_name% ", nativeQuery = true)
	public Set<Products> SearchProduct(@Param("p_name")String p_name);
}

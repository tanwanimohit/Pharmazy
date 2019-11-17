package com.pharamzy.controllers;


import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pharamzy.models.Products;
import com.pharamzy.repository.ProductsRepository;
import com.pharamzy.services.UserServices;

@Controller
public class MainController {

	
	@Autowired
	UserServices userServices;
	
	@Autowired
	ProductsRepository pr;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String getRegister()
	{
		return "register";
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String yo(Model model)
	{
		model.addAttribute("var1","RnadomData");
		return "index";
	}
	
	@RequestMapping(value="/products",method=RequestMethod.GET)
	public String products(@RequestParam("search") String query,Model model)
	{
		Set<Products> products =pr.SearchProduct(query);
		model.addAttribute("querySize",products.size());
		model.addAttribute("products",products);
		return "products";
	}
	
	//to get login form page
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String getLoginForm()
	{
		return "login";
	}
	
	
}

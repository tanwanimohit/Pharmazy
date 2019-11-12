package com.pharamzy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pharamzy.form.LoginForm;

@Controller
public class LoginController {

	//to get login form page
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String getLoginForm()
	{
		return "login";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String getRegister()
	{
		return "register";
	}
	
	//Vaildation 
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@ModelAttribute(name="loginFrom") LoginForm loginform,Model model)
	{
		String username=loginform.getUsername();
		String password=loginform.getPassword();
		
		if("Admin".equals(username) && "Admin".equals(password))
		{
			return "index";
		}
		
		model.addAttribute("InvaildCredentials",true);
		
		return "login";
		
	}
}

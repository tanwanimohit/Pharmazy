package com.pharamzy.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
	import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.pharamzy.models.User;
import com.pharamzy.services.UserServices;

@Controller
public class UserController {

	@Autowired
	UserServices userServices;
	
	
	
	@PostMapping("/adduser")
    public RedirectView addUser( @Valid User user, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
        	return  new RedirectView("/register");
        }
       
        if(userServices.InsertUser(user)!="Success")
        {
        	redirectAttributes.addAttribute("UserAlreadyAdded","true");
        
        	return  new RedirectView("/register");
        }
        else
        {
        	redirectAttributes.addAttribute("Success","true");
        	return  new RedirectView("/login");
        }
        	
    }
	
	@PostMapping("/login")
	public RedirectView login(@ModelAttribute(name="User") User loginform,RedirectAttributes redirectAttributes)
	{
		
		
		if(userServices.VerifyLogin(loginform))
		{
			return new RedirectView("/");
		}
		else
		{
			redirectAttributes.addAttribute("InvaildCredentials",true);
			return new RedirectView("/login");
		}
		
	}
}

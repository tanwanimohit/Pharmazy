package com.pharamzy.controllers;


import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pharamzy.models.Products;
import com.pharamzy.models.User;
import com.pharamzy.repository.ProductsRepository;
import com.pharamzy.services.UserServices;

@Controller
public class MainController {

	
	@Autowired
	UserServices userServices;
	
	@Autowired
	ProductsRepository pr;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String getRegister(Model model,HttpSession session)
	{
		String sessionid=(String)session.getAttribute("sessionid");
		if(sessionid==null)
		{
			
			return "register";
		}
		else
		{
			model.addAttribute("usersession","set");
			model.addAttribute("user",userServices.GetUserDeatil(sessionid));
			return "redirect:/dashboard";
		}
		
	}
	
	
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String Logout(HttpServletRequest request,Model model)
	{
		
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	
	//Main Route.
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String yo(Model model,HttpSession session)
	{
		String sessionid=(String)session.getAttribute("sessionid");
		if(sessionid==null)
		{
			model.addAttribute("usersession","notset");
			return "index";
		}
		else
		{
			model.addAttribute("usersession","set");
			model.addAttribute("user",userServices.GetUserDeatil(sessionid));
			//System.out.print(userServices.GetUserDeatil(sessionid).getU_fname());
			return "redirect:/dashboard";
		}
		
	}
	
	@RequestMapping(value="/dashboard",method=RequestMethod.GET)
	public String Dashboard(Model model,HttpSession session)
	{
		String sessionid=(String)session.getAttribute("sessionid");
		if(sessionid==null)
		{
			model.addAttribute("usersession","notset");
			return "index";
		}
		else
		{
			model.addAttribute("usersession","set");
			User tempuser=userServices.GetUserDeatil(sessionid);
			model.addAttribute("user",tempuser);
			if(tempuser.isEmail_verify())
				return "dashboard";
			else
				return "verify";
		}
		
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
	public String getLoginForm(Model model,HttpSession session)
	{
		String sessionid=(String)session.getAttribute("sessionid");
		if(sessionid==null)
		{
			
			return "login";
		}
		else
		{
			model.addAttribute("usersession","set");
			model.addAttribute("user",userServices.GetUserDeatil(sessionid));
			return "redirect:/dashboard";
		}
		
	}
	
	
}

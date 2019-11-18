package com.pharamzy.controllers;

import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.pharamzy.models.User;
import com.pharamzy.repository.UserRepository;
import com.pharamzy.services.EmailSenderService;
import com.pharamzy.services.UserServices;

@Controller
public class UserController {

	@Autowired
	UserServices userServices;
	
	@Autowired
	UserRepository userRepository;
	
	 @Autowired
	 private EmailSenderService emailSenderService;
	
	@PostMapping("/adduser")
    public RedirectView addUser( @Valid User user, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
        	return  new RedirectView("/register");
        }
       
        user.setToken(UUID.randomUUID().toString());
        user.setEmail_verify(false);
        user.setForget_password(false);
        if(userServices.InsertUser(user)!="Success")
        {
        	redirectAttributes.addAttribute("UserAlreadyAdded","true");
        
        	return  new RedirectView("/register");
        }
        else
        {
        	  SimpleMailMessage mailMessage = new SimpleMailMessage();
              mailMessage.setTo(user.getU_email());
              mailMessage.setSubject("Complete Registration!");
              mailMessage.setFrom("pharmazysuperuser@gmail.com");
              mailMessage.setText("To confirm your account, please click here : "
              +"http://localhost:8080/verifyemail?token="+user.getToken());

              emailSenderService.sendEmail(mailMessage);
        	redirectAttributes.addAttribute("Success","true");
        	return  new RedirectView("/login");
        }
        	
    }
	
	@PostMapping("/login")
	public RedirectView login(@ModelAttribute(name="User") User loginform,RedirectAttributes redirectAttributes,HttpSession session)
	{
		
		
		if(userServices.VerifyLogin(loginform))
		{
			session.setAttribute("sessionid", loginform.getU_email());
			return new RedirectView("/dashboard");
		}
		else
		{
			redirectAttributes.addAttribute("InvaildCredentials",true);
			return new RedirectView("/login");
		}
		
	}
	
	
	
	@GetMapping("/resendverification")
	public RedirectView ResendVerification(HttpSession session,RedirectAttributes redirectAttributes)
	{
		
		String sessionid=(String)session.getAttribute("sessionid");
		if(sessionid==null)
		{
			
			return new RedirectView("/login");
		}
		else
		{
			User tuser=userServices.GetUserDeatil(sessionid);
			if(tuser.isEmail_verify())
			{
				return new RedirectView("/dashboard");
			}
			tuser.setToken(UUID.randomUUID().toString());
	        userRepository.save(tuser);
	        SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(tuser.getU_email());
            mailMessage.setSubject("Complete Registration!");
            mailMessage.setFrom("pharmazysuperuser@gmail.com");
            mailMessage.setText("To confirm your account, please click here : "
            +"http://localhost:8080/verifyemail?token="+tuser.getToken());

            emailSenderService.sendEmail(mailMessage);
            redirectAttributes.addAttribute("resend","true");
            return new RedirectView("/dashboard");
		}
		
	}
	
	@GetMapping("/verifyemail")
	public String VerifyUser(@RequestParam("token") String token)
	{
		User tuser=userServices.VerifyEmail(token);
		if(tuser!=null)
		{
			tuser.setEmail_verify(true);
			userRepository.save(tuser);
			
			return "verified";
		}
		else
		{
			
			return "verifyerror";
		}
			
	}
}

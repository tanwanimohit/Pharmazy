package com.pharamzy.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pharamzy.models.User;
import com.pharamzy.repository.UserRepository;

@Service("userService")
public class UserServices {

	
	@Autowired
	private UserRepository userRepository;
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	
	public String InsertUser(User user)
	{
		user.setU_password(bCryptPasswordEncoder.encode(user.getU_password()));
		if(userRepository.CheckUser(user.getU_email())==null)
		{
			userRepository.save(user);
			return "Success";
		}else {
			return "User Already Added";
		}
	}
	
	public boolean VerifyLogin(User user)
	{
		User tuser=userRepository.CheckUser(user.getU_email());
		if(tuser!=null && BCrypt.checkpw(user.getU_password(), tuser.getU_password())) return true;
		else return false;
	}
	
	
}

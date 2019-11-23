package br.com.alura.forum.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.alura.forum.model.User;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	@ResponseBody
	public String index() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal();
		
		System.out.println("Log do servidor de que foi feita uma requisição para '/'");
		return "Bem vindo ao Forum da Alura " + user.getName() + "!";
	}

}

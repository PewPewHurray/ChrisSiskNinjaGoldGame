package com.codingdojo.ninjagoldgame.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoldController {
	@GetMapping("/gold")
	public String gold(HttpSession session, Model model) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		model.addAttribute(session.getAttribute("gold"));
		return "gold.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/process")
	public String process(HttpSession session, @RequestParam String location, Model model) {
		Random rand = new Random();
		int gold = (int) session.getAttribute("gold");
		Date date = new Date();
		String action = "entered";
		String success = "earned";
		String color = "success";
		int amount = 0;
		
		if (location.equals("farm")) {
			amount = rand.nextInt(11) + 10;
		} else if (location.equals("cave")) {
			amount = rand.nextInt(6) + 5;
		} else if (location.equals("house")) {
			amount = rand.nextInt(4) + 2;
		} else if (location.equals("spa")) {
			amount = rand.nextInt(16) - 20;
			success = "spent";
			color = "primary";
		} else {
			amount = rand.nextInt(101) - 50;
			if (amount == 0) {
				color = "secondary";
				action = "attempted";
				success = "received";
			} else if (amount < 0) {
				action = "failed";
				success = "lost";
				color = "danger";
			} else {
				action = "completed";
			}
		}
		
		gold = gold + amount;
		session.setAttribute("gold", gold);
		
		String message = String.format("<p class='text-%s p-0 m-0'>You %s a %s and %s %s gold. (%s)</p>", color, action,
				location, success, amount, date);
		ArrayList<String> messages = new ArrayList<>();
		
		if (session.getAttribute("messages") != null) {
			messages = (ArrayList<String>) session.getAttribute("messages");
		}
		
		messages.add(0, message);
		session.setAttribute("messages", messages);
		model.addAttribute("messages", messages);
		
		if ((int) session.getAttribute("gold") <= -100) {
			messages.add(0,
					"<p class='text-danger fs-1 p-1 m-1'>You have been sent to prison for going to far into debt!</p>");
			session.setAttribute("messages", messages);
			return "redirect:/prison";
		}
		
		return "redirect:/gold";
	}

	@GetMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("gold", 0);
		session.setAttribute("messages", null);
		return "redirect:/gold";
	}

	@GetMapping("/prison")
	public String prison(HttpSession session, Model model) {
		model.addAttribute(session.getAttribute("messages"));
		model.addAttribute(session.getAttribute("gold"));
		return "prison.jsp";
	}
}

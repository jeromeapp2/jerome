package com.shoppee.pagecontroller;

import org.apache.log4j.Logger;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class PageController {
	private final Logger log = Logger.getLogger(PageController.class);

	@GetMapping("/Message")
	public ModelAndView redict2() {
		return new ModelAndView("/index");
	}

	@GetMapping("/")
	public ModelAndView redictLogin() {
		return new ModelAndView("/Login");
	}

	@GetMapping("/login")
	public ModelAndView Login() {
		return new ModelAndView("/Login");
	}

	@MessageMapping("/sendMessage")
	@SendTo("/topic/video")
	public String sendMessage(String message) {
		// Log the received message
		log.info("Received message: {}" + message);
		// Echo the message back to the clients
		return message;
	}
}

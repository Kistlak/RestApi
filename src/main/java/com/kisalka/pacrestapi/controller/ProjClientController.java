package com.kisalka.pacrestapi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.kisalka.pacrestapi.controller.ImController;
import com.kisalka.pacrestapi.model.ImModel;

@Controller
public class ProjClientController {

	/*@GetMapping("/")
	public String hello() {
		return "index";
	}*/
	
	@Autowired
	private ImController taskService;

	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/projects")
	public String projects(HttpServletRequest request){
		return "Task";
	}
	
	@GetMapping("/projectsupdel")
	public String updeltask(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@GetMapping("/tasks")
	public String insertpage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/taskinsert")
	public String savetask(@ModelAttribute ImModel task, BindingResult bindingResult, HttpServletRequest request){
		taskService.createNote(task);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@GetMapping("/taskupdate")
	public String updatetask(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("task", taskService.findByName(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/taskdelete")
	public String deletetask(@RequestParam int id, HttpServletRequest request){
		taskService.deleteNote(id);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
}

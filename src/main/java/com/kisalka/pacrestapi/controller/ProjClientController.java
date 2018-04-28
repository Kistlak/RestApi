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
	
	@GetMapping("/all-tasks")
	public String allTasks(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@GetMapping("/new-task")
	public String newTask(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-task")
	public String saveTask(@ModelAttribute ImModel task, BindingResult bindingResult, HttpServletRequest request){
		taskService.createNote(task);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@GetMapping("/update-task")
	public String updateNote(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("task", taskService.findByName(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-task")
	public String deleteTask(@RequestParam int id, HttpServletRequest request){
		taskService.deleteNote(id);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
}

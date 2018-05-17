package com.kisalka.pacrestapi.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.filter.CommonsRequestLoggingFilter;

import com.kisalka.pacrestapi.repository.DevnameAndOt;
import com.kisalka.pacrestapi.repository.ImRepository;
import com.kisalka.pacrestapi.repository.IdPnameDevnameHrsAndOt;
import com.kisalka.pacrestapi.model.ImModel;

@RestController
@RequestMapping("/api")
public class ImController {

	/*@GetMapping("/hello")
	public String hello() {
		return "Hey";
	}*/
	
	@Autowired
    private ImRepository TaskRepository;

	@RequestMapping(method=RequestMethod.POST, value="/tasks", produces = "application/json")
    public ImModel createNote(@RequestBody ImModel note) {
        return TaskRepository.save(note);
    }
	
    @GetMapping("/projects")
    public List<IdPnameDevnameHrsAndOt> findAll() {
        return TaskRepository.selectAll();
    }

    @GetMapping("/developers/{id}")
    public DevnameAndOt findByName(@PathVariable final int id){
        return TaskRepository.findAllById(id);
    }

    @PutMapping("/tasks/{id}")
    public ResponseEntity<?> updateNote(@PathVariable(value = "id") int id,
                                           @Valid @RequestBody ImModel noteDetails) {

    	ImModel note = TaskRepository.getOne(id);

        note.setPdate(noteDetails.getPdate());
        note.setHrs(noteDetails.getHrs());
        note.setOt(noteDetails.getOt());

        TaskRepository.save(note);
        return ResponseEntity.ok().build();
    }
    
    @DeleteMapping("/tasks/{id}")
    public ResponseEntity<?> deleteNote(@PathVariable(value = "id") int id) {
    	//ImModel note = TaskRepository.findById(id);

        TaskRepository.deleteById(id);

        return ResponseEntity.ok().build();
    }
    
    @Bean
    public CommonsRequestLoggingFilter logFilter() {
        CommonsRequestLoggingFilter filter
          = new CommonsRequestLoggingFilter();
        filter.setIncludeQueryString(true);
        filter.setIncludePayload(true);
        filter.setMaxPayloadLength(10000);
        filter.setIncludeHeaders(false);
        filter.setAfterMessagePrefix("REQUEST DATA : ");
        return filter;
    }
	
}

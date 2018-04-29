package com.kisalka.pacrestapi.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.kisalka.pacrestapi.repository.ImRepository;
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

	@PostMapping("/tasks")
    public ImModel createNote(@RequestBody ImModel note) {
        return TaskRepository.save(note);
    }
	
    @GetMapping("/projects")
    public List<ImModel> findAll() {
        return (List<ImModel>) TaskRepository.findAll();
    }

    @GetMapping("/developers/{id}")
    public ImModel findByName(@PathVariable final int id){
        return TaskRepository.findById(id);
    }

    @PutMapping("/tasks/{id}")
    public ImModel updateNote(@PathVariable(value = "id") int id,
                                           @Valid @RequestBody ImModel noteDetails) {

    	ImModel note = TaskRepository.findById(id);

        note.setPdate(noteDetails.getPdate());
        note.setHrs(noteDetails.getHrs());
        note.setOt(noteDetails.getOt());

        ImModel updatedNote = TaskRepository.save(note);
        return updatedNote;
    }
    
    @DeleteMapping("/tasks/{id}")
    public ResponseEntity<?> deleteNote(@PathVariable(value = "id") int id) {
    	ImModel note = TaskRepository.findById(id);

        TaskRepository.delete(note);

        return ResponseEntity.ok().build();
    }
	
}

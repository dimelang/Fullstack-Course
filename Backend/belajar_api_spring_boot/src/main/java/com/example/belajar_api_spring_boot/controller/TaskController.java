package com.example.belajar_api_spring_boot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.belajar_api_spring_boot.dto.task.TaskGetRequestDTO;
import com.example.belajar_api_spring_boot.dto.task.TaskPostRequestDTO;
import com.example.belajar_api_spring_boot.dto.task.TaskPutRequestDTO;
import com.example.belajar_api_spring_boot.service.TaskService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("api/tasks")
@CrossOrigin(origins = "*")
public class TaskController {

    @Autowired
    private TaskService taskService;

    // endpoint get all task
    @GetMapping
    public List<TaskGetRequestDTO> getAllTask() {
        return taskService.getAllTask();
    }

    // endpoint get task by id
    @GetMapping("/{id}")
    public TaskGetRequestDTO getTaskById(@PathVariable Long id) {
        return taskService.getTaskById(id);
    }

    // endpoint get tas by user id
    @GetMapping("/user")
    public List<TaskGetRequestDTO> getTaskByUserId(@RequestParam Long id) {
        return taskService.getTastByUserId(id);
    }

    // endpoint create task
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public TaskGetRequestDTO createTask(@Valid @RequestBody TaskPostRequestDTO taskDto) {
        return taskService.createTask(taskDto);
    }

    // endpoint update task
    @PatchMapping(path = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public TaskGetRequestDTO updateTask(@PathVariable Long id, @RequestBody TaskPutRequestDTO taskDto) {
        return taskService.updateTask(taskDto, id);
    }

    // endpoint hapus task
    @DeleteMapping
    public Map<String, Object> deleteTask(@RequestParam Long id) {
        return taskService.deleteTask(id);
    }

}

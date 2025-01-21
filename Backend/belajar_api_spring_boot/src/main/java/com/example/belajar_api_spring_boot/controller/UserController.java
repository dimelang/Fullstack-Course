package com.example.belajar_api_spring_boot.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.belajar_api_spring_boot.dto.user.UserGetRequestDTO;
import com.example.belajar_api_spring_boot.dto.user.UserPostRequestDTO;
import com.example.belajar_api_spring_boot.dto.user.UserPutRequestDTO;
import com.example.belajar_api_spring_boot.service.UserService;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;

@RestController
@RequestMapping("api/users")
@CrossOrigin(origins = "*")
public class UserController {

    @Autowired
    private UserService userService;

    // endpoint get all user
    @GetMapping
    public List<UserGetRequestDTO> getAllUser() {
        return userService.getAllUser();
    }

    // endpoint get user by id
    @GetMapping("/{id}")
    public UserGetRequestDTO getUserById(@PathVariable long id) {
        return userService.getuserById(id);
    }

    // endpoint get user by name and email
    @GetMapping("/login")
    public Optional<UserGetRequestDTO> getUserByNameandEmail(@RequestParam String email,
            @RequestParam String password) {
        return userService.getUserByEmailandPassword(email, password);
    }

    // endpoint create new user
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public UserGetRequestDTO createuser(@Valid @RequestBody UserPostRequestDTO userDto) {

        return userService.createUser(userDto);
    }

    // endpoint update user
    // patch request digunakan untuk update sebagian data
    @PatchMapping(path = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public UserGetRequestDTO updateUser(@PathVariable long id, @RequestBody UserPutRequestDTO userDto) {
        return userService.updateUser(id, userDto);
    }

    // endpoint delete user
    @DeleteMapping()
    public Map<String, Object> deleteUser(@RequestParam Long id) {
        return userService.deleteUser(id);
    }

}

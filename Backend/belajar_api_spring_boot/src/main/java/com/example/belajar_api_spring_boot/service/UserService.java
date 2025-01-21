package com.example.belajar_api_spring_boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.example.belajar_api_spring_boot.dto.task.TaskGetRequestDTO;
import com.example.belajar_api_spring_boot.dto.user.UserGetRequestDTO;
import com.example.belajar_api_spring_boot.dto.user.UserPostRequestDTO;
import com.example.belajar_api_spring_boot.dto.user.UserPutRequestDTO;
import com.example.belajar_api_spring_boot.model.Roles;
import com.example.belajar_api_spring_boot.model.Task;
import com.example.belajar_api_spring_boot.model.User;
import com.example.belajar_api_spring_boot.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TaskService taskService;

    // convert User to get request DTO
    public UserGetRequestDTO convertToGetRequestDTO(User user) {
        List<TaskGetRequestDTO> taskDTOs = user.getTasks().stream().map(taskService::convertToGetRequestDTO)
                .collect(Collectors.toList());
        return UserGetRequestDTO.builder()
                .id(user.getId())
                .name(user.getName())
                .email(user.getEmail())
                .role(user.getRoles().name())
                .tasks(taskDTOs).build();
    }

    // convert User to post request DTO
    public UserPostRequestDTO convertToPostRequestDTO(User user) {
        return UserPostRequestDTO.builder()
                .id(user.getId())
                .name(user.getName())
                .email(user.getEmail())
                .password(user.getPassword())
                .role(user.getRoles().name())
                .build();
    }

    // convert User to put reqeuest DTO
    public UserPutRequestDTO convertToPutRequestDTO(User user) {
        return UserPutRequestDTO.builder()
                .name(user.getName())
                .email(user.getEmail())
                .password(user.getPassword())
                .role(user.getRoles().name())
                .build();
    }

    // gett all user
    public List<UserGetRequestDTO> getAllUser() {
        List<User> users = userRepository.findAll();
        return users.stream().map(this::convertToGetRequestDTO).collect(Collectors.toList());
    }

    // get user by id
    public UserGetRequestDTO getuserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User dengan id: " + id + " tidak ditemukan"));
        return this.convertToGetRequestDTO(user);
    }

    // get user by email and password
    public Optional<UserGetRequestDTO> getUserByEmailandPassword(String email, String password) {
        Optional<User> users = userRepository.findByMailandPassword(email, password);
        return Optional.ofNullable(users.map(this::convertToGetRequestDTO)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                        "User dengan email" + email + " tidak ditemukan")));
    }

    // create new user
    @Transactional
    public UserGetRequestDTO createUser(UserPostRequestDTO userDTO) {
        User user = new User();
        user.setName(userDTO.getName());
        user.setEmail(userDTO.getEmail());
        user.setPassword(userDTO.getPassword());
        user.setRoles(Roles.valueOf(userDTO.getRole()));
        user.setTasks(new ArrayList<>().stream().map(x -> new Task()).collect(Collectors.toList()));
        User savedUser = userRepository.save(user);
        return convertToGetRequestDTO(savedUser);
    }

    // update user
    @Transactional
    public UserGetRequestDTO updateUser(long id, UserPutRequestDTO userDTO) {
        User user = userRepository.findById(id).get();

        if (Objects.nonNull(userDTO.getName())) {
            user.setName(userDTO.getName());
        }

        if (Objects.nonNull(userDTO.getEmail())) {
            user.setEmail(userDTO.getEmail());
        }

        if (Objects.nonNull(userDTO.getPassword())) {
            user.setPassword(userDTO.getPassword());
        }

        if (Objects.nonNull(userDTO.getRole())) {
            user.setRoles(Roles.valueOf(userDTO.getRole()));
        }
        User savedUser = userRepository.save(user);
        return convertToGetRequestDTO(savedUser);
    }

    public Map<String, Object> deleteUser(long id) {
        try {
            User user = userRepository.findById(id).get();
            userRepository.delete(user);
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("message", "Berhasil menghapus user");
            return response;
        } catch (Exception e) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "Gagal menghapus task");
            return response;
        }
    }
}

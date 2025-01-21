package com.example.belajar_api_spring_boot.dto.user;

import java.util.List;

import com.example.belajar_api_spring_boot.dto.task.TaskGetRequestDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserGetRequestDTO {
    private Long id;
    private String name;
    private String email;
    private String role;
    private List<TaskGetRequestDTO> tasks;
}

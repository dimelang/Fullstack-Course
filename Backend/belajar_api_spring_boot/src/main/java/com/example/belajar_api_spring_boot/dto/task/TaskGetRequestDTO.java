package com.example.belajar_api_spring_boot.dto.task;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskGetRequestDTO {
    private Long id;
    private String title;
    private String description;
    private String priority;
    private Boolean status;
}

package com.example.belajar_api_spring_boot.dto.task;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskPostRequestDTO {

    private long id;
    @NotBlank(message = "Title tidak boleh kosong")
    private String title;

    @Size(max = 200, message = "Jumlah karakter description tidak boleh lebih dari 200")
    private String description;

    @NotBlank(message = "Priority tidak boleh kosong")
    private String priority;

    @NotNull(message = "Status tidak boleh kosong")
    private Boolean status;

    // @NotBlank(message = "User tidak boleh kosong")
    // private UserGetRequestDTO user;
    @NotNull(message = "User_id tidak boleh kosong")
    private Long user_id;

    public boolean getStatus() {
        return status;
    }
}

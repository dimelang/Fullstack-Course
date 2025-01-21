# Belajar API Spring Boot

Repository ini menyediakan source code pelatihan membuat API sederhana untuk aplikasi Todo-list menggunakan Spring Boot. Pemanfaatan program ini dapat menggunakan program pada [repository](https://github.com/dimelang/Fullstack-Course/tree/main/Frontend/belajar_http_dan_local_storage)

---
## 🗂️ Repository Structure

```plaintext
.
├── belajar_api_spring_boot/            # Folder source code utama
│   ├── controller/                     # Folder untuk controller
│   │   ├── TaskController.java         # Controller khusus Task
│   │   └── UserController.java         # Controller khusus User
│   │
│   ├── dto/                            # Folder Data Transfer Object
│   │   ├── task                                
│   │   |   ├── TaskGetRequestDTO.java      # DTO khusus class Task request GET
│   │   |   ├── TaskPostRequestDTO.java     # DTO khusus class Task request POST
│   │   |   └── TaskPutRequestDTO.java      # DTO khusus class Task request PUT
│   │   |
│   │   └── user
│   │       ├── UserGetRequestDTO.java      # DTO khusus class User request GET
│   │       ├── UserPostRequestDTO.java     # DTO khusus class User request POST
│   │       └── UserPutRequestDTO.java      # DTO khusus class User request PUT
│   │
│   ├── model/                          # Folder untuk state management menggunakan Bloc
│   │   ├── Priority.java               # Enum priority pada class Task
│   │   ├── Roles.java                  # Enum roles pada class User
│   │   ├── Task.java                   # Entity Task
│   │   └── User.java                   # Entity User
│   │
│   ├── repository/                     
│   │   ├── TaskRepository.java         
│   │   └── UserRepository.java
│   │
│   └── service/
│       ├── TaskService.java
│       └── UserService.java
│
└── resources                           
    └── application.properties          # File konfigurasi

package com.example.belajar_api_spring_boot.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.belajar_api_spring_boot.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // custom JPL Query
    @Query("SELECT u FROM User u WHERE u.email = :email AND u.password=:password")
    Optional<User> findByMailandPassword(@Param("email") String email, @Param("password") String password);

    // custom JPL Query
    @Query("SELECT u.name, COUNT(t) from User u JOIN u.tasks t GROUP BY u.id")
    List<Object[]> countTaskByUser();

    // custom JPL Query
    @Query("SELECT u.roles, COUNT(u) FROM User u GROUP BY u.roles")
    List<Object[]> countRoleByUser();

    // wrapper untuk menangani nilai yang mungkin null secara aman
    // jika entita ditemukan, Optional akan berisi objek User
    Optional<User> findByEmail(String email);

}

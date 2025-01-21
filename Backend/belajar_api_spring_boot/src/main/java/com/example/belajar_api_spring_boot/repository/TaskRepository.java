package com.example.belajar_api_spring_boot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.belajar_api_spring_boot.model.Task;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    // custom JPL Query
    @Query("SELECT t FROM Task t WHERE t.user.id = :user_id")
    List<Task> findTaskByUser(@Param("user_id") Long user_id);

    // custom JPL Query
    @Query("SELECT t FROM Task t ORDER BY t.title ASC")
    List<Task> findAllTaskSortedByName();

    // custom JPL Query
    @Query("SELECT t.priority, COUNT(t) FROM Task t GROUP BY t.priority")
    List<Object[]> countTaskByPriority();

}

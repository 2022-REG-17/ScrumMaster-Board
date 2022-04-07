package com.example.projectManagement.persistance.repository;

import com.example.projectManagement.persistance.model.Task;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface TaskRepository extends MongoRepository<Task, ObjectId> {
}

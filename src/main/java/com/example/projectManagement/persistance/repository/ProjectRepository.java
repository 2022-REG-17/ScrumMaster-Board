package com.example.projectManagement.persistance.repository;

import com.example.projectManagement.persistance.model.Project;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ProjectRepository extends MongoRepository<Project, ObjectId> {
}

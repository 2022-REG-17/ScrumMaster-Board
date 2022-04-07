package com.example.projectManagement.persistance.repository;

import com.example.projectManagement.persistance.model.Sprint;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface SprintRepository extends MongoRepository<Sprint, ObjectId> {
}

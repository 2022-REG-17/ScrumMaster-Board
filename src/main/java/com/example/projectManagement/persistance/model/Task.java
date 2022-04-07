package com.example.projectManagement.persistance.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Data
@Document("Task")
@AllArgsConstructor
@NoArgsConstructor

public class Task {

    @Id
    private ObjectId _id;
    private String name;
    private String description;
    private String status;
    private String member;
    private String comment;

}

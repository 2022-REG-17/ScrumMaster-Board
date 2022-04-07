package com.example.projectManagement.persistance.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;
import java.util.List;

@Data
@Document("Project")
@AllArgsConstructor
@NoArgsConstructor
public class Project {

    @Id
    private ObjectId _id;
    private String name;
    private String createdDate;
    private String admin;
    private String member;

}

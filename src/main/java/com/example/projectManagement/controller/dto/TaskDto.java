package com.example.projectManagement.controller.dto;

import com.example.projectManagement.persistance.model.Task;
import com.example.projectManagement.persistance.model.Ticket;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.bson.types.ObjectId;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class TaskDto {

  private ObjectId _id;
  private String name;
  private String description;
  private String status;
  private String member;
  private String comment;


  public static TaskDto convertToDto(Task task) {
    TaskDto taskDto =
        TaskDto.builder()
            ._id(task.get_id())
            .name(task.getName())
            .description(task.getDescription())
            .status(task.getStatus())
            .member(task.getMember())
            .comment(task.getComment())
            .build();
    return taskDto;
  }
}

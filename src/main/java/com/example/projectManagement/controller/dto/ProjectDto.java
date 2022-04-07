package com.example.projectManagement.controller.dto;

import com.example.projectManagement.persistance.model.Project;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.bson.types.ObjectId;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ProjectDto {

  private ObjectId _id;
  private String name;
  private String createdDate;
  private String admin;
  private String member;

  public static ProjectDto convertToDto(Project project) {
    ProjectDto projectDto =
        ProjectDto.builder()
            ._id(project.get_id())
            .name(project.getName())
            .createdDate(project.getCreatedDate())
            .admin(project.getAdmin())
            .member(project.getMember())
            .build();
    return projectDto;
  }
}

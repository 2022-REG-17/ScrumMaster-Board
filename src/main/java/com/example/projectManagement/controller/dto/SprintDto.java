package com.example.projectManagement.controller.dto;

import com.example.projectManagement.persistance.model.Sprint;
import com.example.projectManagement.persistance.model.Task;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.bson.types.ObjectId;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@JsonInclude(JsonInclude.Include.NON_NULL)

public class SprintDto {

    private ObjectId _id;
    private String name;
    private String startDate;
    private String dueDate;

  public static SprintDto convertToDto(Sprint sprint) {
    SprintDto sprintDto =
        SprintDto.builder()
            ._id(sprint.get_id())
            .name(sprint.getName())
            .startDate(sprint.getStartDate())
            .dueDate(sprint.getDueDate())
            .build();
    return sprintDto;
    }
}

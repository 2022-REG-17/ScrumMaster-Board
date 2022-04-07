package com.example.projectManagement.controller;
import com.example.projectManagement.controller.dto.PageableDto;
import com.example.projectManagement.controller.dto.TaskDto;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Task;
import com.example.projectManagement.service.TaskService;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/tasks")
public class TaskController {

  @Autowired TaskService taskService;

  @GetMapping()
  public PageableDto<TaskDto> getTask(
      @PageableDefault()
          @SortDefault.SortDefaults({@SortDefault(sort = "name", direction = Sort.Direction.ASC)})
          Pageable pageable) {
    PageableEntityData<Task> serviceData = taskService.getTaskList(pageable);
    List<TaskDto> taskList =
        serviceData.getData().stream().map(TaskDto::convertToDto).collect(Collectors.toList());

    return new PageableDto<>(taskList, serviceData.getTotalRecords());
  }

  @PostMapping()
  public TaskDto createTask(@Validated @RequestBody TaskDto taskDto) {
    return taskService.create(taskDto);
  }

  @PutMapping("/{objectId}")
  public TaskDto updateTask(
      @PathVariable ObjectId objectId, @Validated @RequestBody TaskDto taskDto) {
    return taskService.update(objectId, taskDto);
  }

  @DeleteMapping("/{objectId}")
  public String deleteTask(@PathVariable ObjectId objectId) {
    return taskService.Delete(objectId);
  }
}

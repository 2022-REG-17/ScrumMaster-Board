package com.example.projectManagement.service;

import com.example.projectManagement.controller.dto.TaskDto;
import com.example.projectManagement.controller.exception.handel.NoContentException;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Task;
import com.example.projectManagement.persistance.repository.TaskRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TaskService {

  @Autowired private TaskRepository taskRepository;

  public PageableEntityData<Task> getTaskList(Pageable pageable) {
    Page<Task> TaskList = taskRepository.findAll(pageable);
    if (TaskList.getContent().isEmpty()) throw new NoContentException();
    return new PageableEntityData<>(TaskList.getContent(), TaskList.getTotalElements());
  }

  public TaskDto create(TaskDto taskDto) {
    Task task = new Task();
    task.setName(taskDto.getName());
    task.setDescription(taskDto.getDescription());
    task.setStatus(taskDto.getStatus());
    task.setMember(taskDto.getMember());
    task.setComment(taskDto.getComment());
    taskRepository.save(task);
    return taskDto;
  }

  public TaskDto update(ObjectId id, TaskDto taskDto) {
    Task task = taskRepository.findById(id).get();
    task.setName(taskDto.getName());
    task.setDescription(taskDto.getDescription());
    task.setStatus(taskDto.getStatus());
    task.setMember(taskDto.getMember());
    task.setComment(taskDto.getComment());
    taskRepository.save(task);
    return taskDto;
  }


  public String Delete(ObjectId id) {
    taskRepository.deleteById(id);
    return "deleted";
  }
}

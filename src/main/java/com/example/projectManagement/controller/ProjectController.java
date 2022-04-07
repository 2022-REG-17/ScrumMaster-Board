package com.example.projectManagement.controller;

import com.example.projectManagement.controller.dto.PageableDto;
import com.example.projectManagement.controller.dto.ProjectDto;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Project;
import com.example.projectManagement.service.ProjectService;
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
@RequestMapping("/api/v1/projects")
public class ProjectController {

  @Autowired ProjectService projectService;

  @GetMapping()
  public PageableDto<ProjectDto> getProject(
      @PageableDefault()
          @SortDefault.SortDefaults({@SortDefault(sort = "name", direction = Sort.Direction.ASC)})
          Pageable pageable) {
    PageableEntityData<Project> serviceData = projectService.getProjectList(pageable);
    List<ProjectDto> projectList =
        serviceData.getData().stream().map(ProjectDto::convertToDto).collect(Collectors.toList());

    return new PageableDto<>(projectList, serviceData.getTotalRecords());
  }

  @PostMapping()
  public ProjectDto createProject(@Validated @RequestBody ProjectDto projectDto) {
    return projectService.create(projectDto);
  }

  @PutMapping("/{objectId}")
  public ProjectDto updateProject(
      @PathVariable ObjectId objectId, @Validated @RequestBody ProjectDto projectDto) {
    return projectService.update(objectId, projectDto);
  }

  @DeleteMapping("/{objectId}")
  public String deleteProject(@PathVariable ObjectId objectId) {
    return projectService.Delete(objectId);
  }
}

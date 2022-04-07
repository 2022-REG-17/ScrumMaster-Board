package com.example.projectManagement.service;

import com.example.projectManagement.controller.dto.ProjectDto;
import com.example.projectManagement.controller.exception.handel.NoContentException;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Project;
import com.example.projectManagement.persistance.repository.ProjectRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    public PageableEntityData<Project> getProjectList(Pageable pageable) {
        Page<Project> ProjectList = projectRepository.findAll(pageable);
        if (ProjectList.getContent().isEmpty()) throw new NoContentException();
        return new PageableEntityData<>(ProjectList.getContent(), ProjectList.getTotalElements());
    }

    public ProjectDto create(ProjectDto projectDto) {
        Project project = new Project();
        project.setName(projectDto.getName());
        project.setCreatedDate(projectDto.getCreatedDate());
        project.setAdmin(projectDto.getAdmin());
        project.setMember(projectDto.getMember());
        projectRepository.save(project);
        return projectDto;
    }

    public ProjectDto update(ObjectId id, ProjectDto projectDto) {
        Project project = projectRepository.findById(id).get();
        project.setName(projectDto.getName());
        project.setAdmin(projectDto.getAdmin());
        project.setMember(projectDto.getMember());
        projectRepository.save(project);
        return projectDto;
    }

    public String Delete(ObjectId id) {
        projectRepository.deleteById(id);
        return "deleted";
    }

}

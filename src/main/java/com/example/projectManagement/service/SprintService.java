package com.example.projectManagement.service;

import com.example.projectManagement.controller.dto.SprintDto;
import com.example.projectManagement.controller.exception.handel.NoContentException;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Sprint;
import com.example.projectManagement.persistance.repository.SprintRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class SprintService {

  @Autowired private SprintRepository sprintRepository;

  public PageableEntityData<Sprint> getSprintList(Pageable pageable) {
    Page<Sprint> SprintList = sprintRepository.findAll(pageable);
    if (SprintList.getContent().isEmpty()) throw new NoContentException();
    return new PageableEntityData<>(SprintList.getContent(), SprintList.getTotalElements());
  }

  public SprintDto create(SprintDto sprintDto) {
    Sprint sprint = new Sprint();
    sprint.setName(sprintDto.getName());
    sprint.setStartDate(sprintDto.getStartDate());
    sprint.setDueDate(sprintDto.getDueDate());
    sprintRepository.save(sprint);
    return sprintDto;
  }

  public SprintDto update(ObjectId id, SprintDto sprintDto) {
    Sprint sprint = sprintRepository.findById(id).get();
    sprint.setName(sprintDto.getName());
    sprint.setStartDate(sprintDto.getStartDate());
    sprint.setDueDate(sprintDto.getDueDate());
    sprintRepository.save(sprint);
    return sprintDto;
  }

  public String Delete(ObjectId id) {
    sprintRepository.deleteById(id);
    return "deleted";
  }
}

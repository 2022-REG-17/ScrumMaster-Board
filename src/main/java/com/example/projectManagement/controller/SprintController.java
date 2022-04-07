package com.example.projectManagement.controller;

import com.example.projectManagement.controller.dto.PageableDto;
import com.example.projectManagement.controller.dto.SprintDto;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Sprint;
import com.example.projectManagement.service.SprintService;
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
@RequestMapping("/api/v1/sprints")
public class SprintController {

  @Autowired SprintService sprintService;

  @GetMapping()
  public PageableDto<SprintDto> getSprint(
      @PageableDefault()
          @SortDefault.SortDefaults({@SortDefault(sort = "name", direction = Sort.Direction.ASC)})
          Pageable pageable) {
    PageableEntityData<Sprint> serviceData = sprintService.getSprintList(pageable);
    List<SprintDto> sprintList =
        serviceData.getData().stream().map(SprintDto::convertToDto).collect(Collectors.toList());

    return new PageableDto<>(sprintList, serviceData.getTotalRecords());
  }

  @PostMapping()
  public SprintDto createSprint(@Validated @RequestBody SprintDto sprintDto) {
    return sprintService.create(sprintDto);
  }

  @PutMapping("/{objectId}")
  public SprintDto updateSprint(
      @PathVariable ObjectId objectId, @Validated @RequestBody SprintDto sprintDto) {
    return sprintService.update(objectId, sprintDto);
  }

  @DeleteMapping("/{objectId}")
  public String deleteSprint(@PathVariable ObjectId objectId) {
    return sprintService.Delete(objectId);
  }
}

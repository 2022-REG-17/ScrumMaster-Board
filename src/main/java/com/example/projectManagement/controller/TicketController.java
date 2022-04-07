package com.example.projectManagement.controller;

import com.example.projectManagement.controller.dto.PageableDto;
import com.example.projectManagement.controller.dto.TicketDto;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Ticket;
import com.example.projectManagement.service.TicketService;
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
@RequestMapping("/api/v1/tickets")
public class TicketController {

  @Autowired TicketService ticketService;

  @GetMapping()
  public PageableDto<TicketDto> getTicket(
      @PageableDefault()
          @SortDefault.SortDefaults({@SortDefault(sort = "name", direction = Sort.Direction.ASC)})
          Pageable pageable) {
    PageableEntityData<Ticket> serviceData = ticketService.getTicketList(pageable);
    List<TicketDto> ticketList =
        serviceData.getData().stream().map(TicketDto::convertToDto).collect(Collectors.toList());

    return new PageableDto<>(ticketList, serviceData.getTotalRecords());
  }

  @PostMapping()
  public TicketDto createTicket(@Validated @RequestBody TicketDto ticketDto) {
    return ticketService.create(ticketDto);
  }

  @PutMapping("/{objectId}")
  public TicketDto updateTicket(
      @PathVariable ObjectId objectId, @Validated @RequestBody TicketDto ticketDto) {
    return ticketService.update(objectId, ticketDto);
  }

  @DeleteMapping("/{objectId}")
  public String deleteTicket(@PathVariable ObjectId objectId) {
    return ticketService.Delete(objectId);
  }
}

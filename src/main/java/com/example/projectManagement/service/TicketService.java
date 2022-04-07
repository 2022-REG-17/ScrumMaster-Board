package com.example.projectManagement.service;

import com.example.projectManagement.controller.dto.TicketDto;
import com.example.projectManagement.controller.exception.handel.NoContentException;
import com.example.projectManagement.persistance.model.PageableEntityData;
import com.example.projectManagement.persistance.model.Ticket;
import com.example.projectManagement.persistance.repository.TicketRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TicketService {

  @Autowired private TicketRepository ticketRepository;

  public PageableEntityData<Ticket> getTicketList(Pageable pageable) {
    Page<Ticket> TicketList = ticketRepository.findAll(pageable);
    if (TicketList.getContent().isEmpty()) throw new NoContentException();
    return new PageableEntityData<>(TicketList.getContent(), TicketList.getTotalElements());
  }

  public TicketDto create(TicketDto ticketDto) {
    Ticket ticket = new Ticket();
    ticket.setName(ticketDto.getName());
    ticket.setCreatedDate(ticketDto.getCreatedDate());
    ticket.setDescription(ticketDto.getDescription());
    ticket.setStatus(ticketDto.getStatus());
    ticket.setComment(ticketDto.getComment());
    ticketRepository.save(ticket);
    return ticketDto;
  }

  public TicketDto update(ObjectId id, TicketDto ticketDto) {
    Ticket ticket = ticketRepository.findById(id).get();
    ticket.setName(ticketDto.getName());
    ticket.setDescription(ticketDto.getDescription());
    ticket.setStatus(ticketDto.getStatus());
    ticket.setComment(ticketDto.getComment());
    ticketRepository.save(ticket);
    return ticketDto;
  }

  public String Delete(ObjectId id) {
    ticketRepository.deleteById(id);
    return "deleted";
  }
}

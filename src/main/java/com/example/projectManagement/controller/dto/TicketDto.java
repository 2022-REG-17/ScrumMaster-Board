package com.example.projectManagement.controller.dto;

import com.example.projectManagement.persistance.model.Ticket;
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
public class TicketDto {

  private ObjectId _id;
  private String name;
  private String createdDate;
  private String description;
  private String status;
  private String comment;

  public static TicketDto convertToDto(Ticket ticket) {
    TicketDto ticketDto =
        TicketDto.builder()
            ._id(ticket.get_id())
            .name(ticket.getName())
            .createdDate(ticket.getCreatedDate())
            .description(ticket.getDescription())
            .status(ticket.getStatus())
            .comment(ticket.getComment())
            .build();

    return ticketDto;
  }
}

package com.example.projectManagement.controller.exception;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ExceptionResponse {

  private String message;
  private LocalDateTime dateTime;
}

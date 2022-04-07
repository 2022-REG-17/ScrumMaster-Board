package com.example.projectManagement.persistance.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class PageableEntityData<T> {
  private List<T> data;
  private long totalRecords;
}

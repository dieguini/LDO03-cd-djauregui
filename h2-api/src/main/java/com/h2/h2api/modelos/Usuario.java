package com.h2.h2api.modelos;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table
@Data // Genera setters, getters, toString, equals, hashcode
@AllArgsConstructor // Constructor con todos los argumentos
@NoArgsConstructor // Constructor sin argumentos
public class Usuario {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  @Column(nullable = false)
  private String nombre;
  @Column(nullable = false)
  private String apellido;
  @Column(length = 16)
  private String telefono;
  @Column(nullable = false)
  private String direccion;
}

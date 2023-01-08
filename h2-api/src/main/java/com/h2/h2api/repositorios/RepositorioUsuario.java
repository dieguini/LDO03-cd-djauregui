package com.h2.h2api.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import com.h2.h2api.modelos.Usuario;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long> {
  
}

package com.h2.h2api.servicios;

import java.util.Optional;

import com.h2.h2api.modelos.Usuario;

public interface ServicioUsuario {
  Usuario guardarUsuario(Usuario usuario);

  Optional<Usuario> obtenerUsuario(Long idUsuario);

  Usuario usuarioAModificar(Long id, Usuario usuarioModificar);

  boolean eliminarUsuario(Long id);
}

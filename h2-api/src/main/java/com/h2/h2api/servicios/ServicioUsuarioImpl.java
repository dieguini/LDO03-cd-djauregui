/* package com.h2.h2api.servicios;

import java.util.Optional;

import javax.management.RuntimeErrorException;

import org.springframework.stereotype.Service;

import com.h2.h2api.modelos.Usuario;
import com.h2.h2api.repositorios.RepositorioUsuario;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ServicioUsuarioImpl implements ServicioUsuario {

  private final RepositorioUsuario repositorioUsuario;

  @Override
  public Usuario guardarUsuario(Usuario usuario) {
    return repositorioUsuario.save(usuario);
  }

  @Override
  public Optional<Usuario> obtenerUsuario(Long idUsuario) {
    return repositorioUsuario.findById(idUsuario);
  }

  @Override
  public Usuario usuarioAModificar(Long id, Usuario usuarioModificar) {
    Usuario usuarioBuscado = repositorioUsuario.findById(id).get();
    usuarioBuscado.setDireccion(usuarioModificar.getDireccion());
    return repositorioUsuario.save(usuarioBuscado);
  }

  @Override
  public boolean eliminarUsuario(Long id) {
    try {
      repositorioUsuario.deleteById(id);
      return true;
    } catch (Exception e) {
      return false;
    }
  }
  
}
 */
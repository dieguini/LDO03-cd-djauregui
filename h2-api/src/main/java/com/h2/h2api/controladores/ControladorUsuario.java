package com.h2.h2api.controladores;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.h2.h2api.modelos.Usuario;
import com.h2.h2api.servicios.ServicioUsuario;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/usuarios")
@RequiredArgsConstructor
public class ControladorUsuario {
  private final ServicioUsuario servicioUsuario;

  // Json de tipo usuario
  @PostMapping
  public ResponseEntity guardarUsuario(@RequestBody Usuario usuario){
    return new ResponseEntity<>(
      servicioUsuario.guardarUsuario(usuario), 
      HttpStatus.CREATED
    );
  }

  @GetMapping("/{id}")
  public ResponseEntity obtenerUsuario(@PathVariable("id") Long idUsuario){
    return new ResponseEntity<>(
      servicioUsuario.obtenerUsuario(idUsuario), 
      HttpStatus.CREATED
    );
  }

  @PutMapping("/{id}")
  public ResponseEntity modificarUsuario(@PathVariable("id") Long idUsuario, @RequestBody Usuario usuario){
    return new ResponseEntity<>(
      servicioUsuario.usuarioAModificar(idUsuario, usuario),
      HttpStatus.OK
    );
  }

  @DeleteMapping("/{id}")
  public ResponseEntity eliminarUsuario(@PathVariable("id") Long idUsuario){
    boolean respuesta = servicioUsuario.eliminarUsuario(idUsuario);
    if(respuesta)
      return new ResponseEntity<>(HttpStatus.OK);
    else
      return new ResponseEntity<>(HttpStatus.NOT_FOUND);
  }
}

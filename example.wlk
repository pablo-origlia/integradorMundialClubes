class Jugador {
  const property nombre
  var precioBase
  
  method cotizacion() = nombre.length() * precioBase
}

class Equipo {
  const property jugadores = #{}
  
  method jugadoresMejorCotizacion() = jugadores.filter({ j => j.cotizacion() > 1 })
  
  method valoracionPlantel() = self.jugadoresMejorCotizacion().sum({ j => j.cotizacion() })
  
  method potencial() = self.valoracionPlantel()
  
  method leGanaA(equipo) = self.potencial() > (equipo.potencial() * 1.2)
}

class EquipoEuropeo inherits Equipo {
  var champions
  
  override method potencial() = super() * champions
}

class EquipoConmebol inherits Equipo {
  var popularidad
  var hinchada
  
  method hinchada(nuevaHinchada) {
    hinchada = nuevaHinchada
  }
  
  method popularidad() = popularidad
  
  method motivacion() = hinchada.motivacion(self)
  
  override method potencial() = super() * self.motivacion()
}

object hinchadaEntusiasta {
  method motivacion(equipo) = equipo.popularidad() ** 2
}

object hinchadaPechoFrio {
  method motivacion(equipo) = 1.max(equipo.popularidad() * 0.1)
}

object hinchadaMercenaria {
  method motivacion(equipo) = equipo.valoracionPlantel() * 0.01
}

class EquipoLocal inherits Equipo {
  const ciudad
  
  override method potencial() = super() * ciudad.poblacion()
}

class Ciudad {
  var property poblacion
}

class Resultado {
  method ganador()
}

class Victoria inherits Resultado {
  const equipo
  
  override method ganador() = equipo
}

class Empate inherits Resultado {
  override method ganador() = null
}

class Partido {
  const local
  const visitante
  
  method jugo(equipo) = equipo == local or equipo == visitante

  method adversario(equipo) {
    if (equipo == local) {
      return visitante
    } else {
      if (equipo == visitante) {
        return local
      } else {
        self.error("Equipo no válido!")
      }
    }
  }
  
  method puntosPosiblesPara(equipo) {
    if (equipo.leGanaA(self.adversario(equipo))) {
      return 3
    } else {
      if (self.adversario(equipo).leGanaA(equipo)) {
        return 0
      } else {
        return 1
      }
    }
  }
  
  method resultado() {
    if (local.leGanaA(visitante)) {
      return new Victoria(equipo = local)
    } else {
      if (visitante.leGanaA(local)) {
        return new Victoria(equipo = visitante)
      } else {
        return new Empate()
      }
    }
  }
}

class Grupo {
  const property equipos = #{}
  const property partidos = #{}

  method agregarPartido(unEquipo, otroEquipo) {
    // Si fuese lista
    /*
    if (not equipos.contains(unEquipo)) {
      equipos.add(unEquipo)
    }
    if (not equipos.contains(otroEquipo)) {
      equipos.add(otroEquipo)
    }
    */

    // Si es conjunto
    // en caso de utilizar generarPartidos estas dos lineas van comentadas
    //equipos.add(unEquipo)
    //equipos.add(otroEquipo)
    partidos.add(new Partido(local=unEquipo, visitante=otroEquipo))
  }

  method generarPartidos() {
    equipos.forEach({e=>
      equipos.remove(e)
      equipos.forEach({resto=>
        self.agregarPartido(e, resto)
      })
    })
  }

  method partidosJugadosPor(equipo) = partidos.filter({p=>p.jugo(equipo)})

  method puntos(equipo) = self.partidosJugadosPor(equipo).sum({p=>p.puntosPosiblesPara(equipo)})
}
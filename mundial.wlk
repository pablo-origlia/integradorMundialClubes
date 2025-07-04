class Jugador {
  const property nombre
  var precioBase
  
  method cotizacion() = nombre.length() * precioBase
}

class Equipo {
  var property jugadores
  
  method valoracionPlantel() = jugadores.filter(
    { j => j.cotizacion() > 1 }
  ).sum({ j => j.cotizacion() })
  
  method potencial() = self.valoracionPlantel()
  
  method leGanaA(equipo) = self.potencial() > (equipo.potencial() * 1.2)
}

class EquipoEuropeo inherits Equipo {
  var champions
  
  override method potencial() = super() * champions
}

class EquipoConmebol inherits Equipo {
  var property popularidad
  var property hinchada
  
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
} // Clase abstracta Resultado

class Resultado {
  method ganador()
} // Clase Victoria: representa que un equipo ganó

class Victoria inherits Resultado {
  var equipo
  
  override method ganador() = equipo
} // Clase Empate: representa un empate (no hay ganador)

class Empate inherits Resultado {
  override method ganador() = null
}

class Partido {
  const local
  const visitante
  
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
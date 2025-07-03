class Jugador {
  const property nombre
  var precioBase
  
  method cotizacion() = nombre.length() * precioBase
}

class Equipo {
  var property jugadores
  
  method valoracionPlantel() = jugadores.filter({ j => j.cotizacion() > 1 }).sum({ j => j.cotizacion() })
  
  method potencial() = self.valoracionPlantel()
  
  method leGanaA(equipo) = self.potencial() > (equipo.potencial() * 1.2)
}

class EquipoEuropeo inherits Equipo {
  var champions
  
  method potencial() = super() * champions
}

class EquipoConmebol inherits Equipo {
  var property popularidad
  var property hinchada
  
  method motivacion() = hinchada.motivacion(self)
  
  method potencial() = super() * self.motivacion()
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
  var habitantes
  
  override method potencial() = self.valoracionPlantel() * habitantes
}

class Partido {
  const local
  const visitante
  
  method hayGanador() = local.leGanaA(visitante) or visitante.leGanaA(local)
  
  method hayEmpate() = (not local.leGanaA(visitante)) and (not visitante.leGanaA(local))
  
  method ganador() {
    if (local.leGanaA(visitante)) {
      return local
    }
    return visitante
  }
}
class Equipo {
  const jugadores = [] 

  //method potencial() = self.valoracion() 
  method potencial() = self.valoracion() * self.potencialExtra()
  method valoracion() = jugadores.filter{j=>j.cotizacion()>1}.sum{j=>j.cotizacion()}
  method potencialExtra() = 1
  method seVaElDeMayorCotizacion() {
      jugadores.remove(self.elDeMayorCotizacion())
  }
  method elDeMayorCotizacion() = jugadores.max{j=>j.cotizacion()}
}

class EquipoConmebol inherits Equipo{
  var estiloHinchada = entusiasta
  var property popularidad

  //override method potencial() = super() * estiloHinchada.motivacion(self)
  override method potencialExtra() = estiloHinchada.motivacion(self)
  method aumentoPublico(cantidad) {
    popularidad = popularidad + cantidad 
    estiloHinchada = estiloHinchada.masPublico()
  }
}

object entusiasta{
  method motivacion(equipo) = equipo.popularidad() * equipo.popularidad()
  method masPublico() = self
}

object pechoFrio{
  method motivacion(equipo) = (equipo.popularidad() / 10).max(1)
  method masPublico() = entusiasta
}

object mercenaria{
  method motivacion(equipo) = equipo.valoracion() * 0.01
  method masPublico() = pechoFrio
}

class EquipoEuropeo inherits Equipo{
  var champions = 0
  //override method potencial() = super() * champions
  override method potencialExtra() = champions

}

class EquipoEEUU inherits Equipo{
  const ciudad
  //override method potencial() = super() * ciudad.poblacion()
  override method potencialExtra() =  ciudad.poblacion()
  
}

class Ciudad {
  var property poblacion 
}


class Jugador{
  var monto
  const nombre
  method cotizacion() = monto * nombre.length()
}

class JugadorPremiado inherits Jugador{
  var premio
  override method cotizacion() = super() + premio
}

class Partido{
  const equipo1
  const equipo2
  method cuantosPuntosHizo(equipo) {
    const otro = self.adversario(equipo)  
    if (equipo.potencial() > otro.potencial())
      return 3
    else if (equipo.potencial() == otro.potencial())
      return 1
    else 
      return 0
  }
  method adversario(equipo) = if (equipo == equipo1) equipo2 else equipo1 
  method jugo(equipo) = equipo == equipo1 or equipo == equipo2
}

class Grupo {
  const partidos= []
  const equipos = []

  method crearPartido(e1, e2){
    const p = new Partido(equipo1 = e1, equipo2 = e2)
    partidos.add(p)
  }

  method puntosDe(equipo) = partidos.filter{p=>p.jugo(equipo)}.sum{p=>p.cuantosPuntosHizo(equipo)}

  method guerraComercial(){
    equipos.forEach{e=>e.seVaElDeMayorCotizacion()}
  }
}
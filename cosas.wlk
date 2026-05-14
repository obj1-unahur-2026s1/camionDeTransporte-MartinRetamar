object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10  
    method bultos() = 1 
    method consecuenciaDeLaCarga() {
        // no hace nada
    } 
}

object bumblebee {
    var formaActual = auto

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()
    method cambiarForma(forma) {
        formaActual = forma
    } 

    method bultos() = 2
    method consecuenciaDeLaCarga(){
        self.cambiarForma(robot)
    }
}
object auto {method nivel() = 15 }
object robot {method nivel() = 30 }

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 10

    method peso() = 2 * cantidadDeLadrillos
    method nivelDePeligrosidad() = 2
    method cambiarForma(cantidad) {
        cantidadDeLadrillos = cantidad
    } 
    method cambiarCantidad(cantidad) {
      cantidadDeLadrillos = cantidad
    }
    method bultos(){
        if(cantidadDeLadrillos < 100){
            return 1
        } else if(cantidadDeLadrillos.between(101, 300)){
            return 2
        } else{
            return 3
        }
    }
}

object arena {
    var property peso = 10
    
    method nivelDePeligrosidad() = 2
    method bultos() = 1 
}

object bateria {
    var estaConMisiles = false

    method peso() = if (estaConMisiles) 300 else 200
    method nivelDePeligrosidad() = if(estaConMisiles) 100 else 0
    method cargarYDescargarMisiles() = if(estaConMisiles == true) false else true
    
    method bultos() = if (estaConMisiles) 2 else 1
    
}

object contenedor {
  const cosasContenidas = []

  method bultos() = 1 + self.bultosDeCosasContenidas()
  method bultosDeCosasContenidas() = cosasContenidas.sum({c => c.bultos()})

  method peso() = 100 + self.pesoDeCosasContenidas()
  method pesoDeCosasContenidas() = cosasContenidas.sum({c => c.peso()})
  method nivelDePeligrosidad() = if (not cosasContenidas.isEmpty()) self.cosaContenidaMasPeligrosa().nivelDePeligrosidad() else 0
  method cosaContenidaMasPeligrosa() = cosasContenidas.max({c => c.nivelDePeligrosidad()})

  method meterElementos(listaDeElementos){
    cosasContenidas.addAll(listaDeElementos)
  }
}

object residuos {
  var property peso = 10

  method nivelDePeligosidad() = 200
  method bultos() = 1 

}

object embalaje {
    var cosaQueEmvuelve = residuos

    method peso() = cosaQueEmvuelve.peso()
    method nivelDePeligrosidad() = cosaQueEmvuelve.nivelDePeligosidad() * 0.5
    method cambiarLoQueEnvuelve(nuevaCosa) {
        cosaQueEmvuelve = nuevaCosa
    }
    method bultos() = 2
}




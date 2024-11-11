

class Vikingo {
var casta

method puedeIrAunaExpedicion(unaExpedicion){
  return self.esProductivo() || self.laCastaLoPermite()
}

method esProductivo()

method laCastaLoPermite(){
  return casta.loPermite(self)
}

method subirVikingo(unaExpedicion){
  if(self.puedeIrAunaExpedicion(unaExpedicion)){
    unaExpedicion.agregarVikingo(self)
  }
}

 method agregarVictima()

 method ascenderSocialmente(){
    casta.ascender(self)
 }

 method casta(nuevaCasta){
  casta = nuevaCasta
 }

method recompensasKarl()
}

class Granjero inherits Vikingo {
var hectareas 
var hijos 

override method esProductivo(){
  return hectareas / hijos >= 2
}

method tieneArmas(){
  return false
}

override method agregarVictima(){}


override method recompensasKarl(){
  hijos += 2
  hectareas += 2
}
}

class Soldado  inherits Vikingo{
var asesinatos
var armas 

override method esProductivo(){
  return !self.tieneArmas() && self.muyAsesino()
}

method tieneArmas(){
  return armas > 10
}

method muyAsesino(){
  return asesinatos > 20 
}

override method agregarVictima(){
  asesinatos += 1
}

override method recompensasKarl(){
  armas += 10
}
}


object jarl{

  method loPermite(unVikingo){
   return  !unVikingo.tieneArmas()
  }

  method ascenderSocialmente(unVikingo){
    unVikingo.casta(karl)
    unVikingo.recompensasKarl()
  }

}

object karl{

  method loPermite() = true 

  method ascenderSocialmente(unVikingo){
    unVikingo.casta(thrall)
  }

}

object thrall{

  method loPermite() = true 

  method ascenderSocialmente(unVikingo){
    
  }
}
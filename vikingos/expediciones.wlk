class Expedicion{
    var objetivos 
    const integrantes


    method valeLaPena(){
        return objetivos.valenLaPena(integrantes)
    }

    method agregarVikingo(unVikingo){
        integrantes.add(unVikingo)
    }

    method realizar(){
        objetivos.serAtacados(integrantes)
    }
}

class InvasionDeCapital{
var defensoresDerrotados
var factorDeRiqueza

    method valenLaPena(integrantes){
        return self.botinConseguido() / integrantes.size() >= 3
    }

    method botinConseguido(){
        return defensoresDerrotados * factorDeRiqueza
    }

    method serAtacados(integrantes){
        defensoresDerrotados += integrantes.size()
        integrantes.forEach{vikingo => vikingo.agregarVictima()}
        integrantes.forEach{vikingo => vikingo.aumentarDinero(self.botinRepartido(integrantes))}
    }

    method botinRepartido(integrantes){
        return self.botinConseguido() / integrantes.size()
    }
}

class InvasionDeAldeas{
var tipoDefensa
const aldeas

    method valeLaPena(integrantes){
        aldeas.all{aldea => aldea.valeLaPena()}
    }

    method serAtacados(integrantes){
        integrantes.forEach{vikingo => vikingo.aumentarDinero(self.botinRepartido(integrantes))}
        aldeas.forEach{aldea => aldea.sacarTodosCrucifijos()}
    }

    method botinRepartido(integrantes){
        return self.botin() / integrantes.size()
     }

    method botin(){
        return aldeas.sum{aldea => aldea.cantidadMonedas()}
    }


}

class Aldea{
    var cantidadCrucifijos

    method valeLaPena(integrantes){
    return self.cantidadMonedas() > 15 
    }

    method sacarTotalCrucifijos(){
        cantidadCrucifijos = 0
    }

    method cantidadMonedas(){
        return cantidadCrucifijos
    }
    
}

class AldeaAmurallada inherits Aldea{
var cantidadMinimaVikingos

    override method valeLaPena(integrantes){
        return super(integrantes) && integrantes.size() >= cantidadMinimaVikingos
    }
}
import plantas.*

class Parcela {
	var property ancho = 0 
	var property largo = 0
	const property plantas = []
	var property horasDeSol = 0

	method superficie(){
		return largo * ancho
	}
	method cantidadMaximaDePlantas(){
		return if(self.largo() > 3){largo + 4}
			else{self.superficie() /2}
		}
	method tieneComplicaciones(){
		return plantas.any({p => p.horasDeSolToleradas() < horasDeSol})
	}
	
	
	
	method plantarPlanta(unaPlanta){
		if(plantas.size() >= self.cantidadMaximaDePlantas() or
		(self.horasDeSol() - unaPlanta.horasDeSolToleradas()) > 2){
			self.error("La planta no entra en la parcela")
		}
			else{
			plantas.add(unaPlanta)
		}
		
		
		
	}
	method asociaBienPara()
	
	method cantidadDePlantas(){
		return plantas.size()
	}
	
	method cantidadDeBienAsociadas(){
        		return plantas.count({planta=>planta.asociaBienPara(self)})
    }

    	method porcentajeDeBienAsociadas(){
        		return (self.cantidadDeBienAsociadas()*100)/self.plantas()
    }

	
}
class ParcelaEcologica  inherits Parcela{
	method asociaBienPara(unaPlanta){
        		return self.tieneComplicaciones() and unaPlanta.parcelaEsIdeal(self) 
    	}
}

class ParcelaIndustrial  inherits Parcela{
	 method asociaBienPara(unaPlanta){
        		return plantas.size() <= 2 and unaPlanta.esFuerte()
    	}
}









	
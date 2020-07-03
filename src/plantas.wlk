import parcelas.*

class Planta{
	var property anioDeObtencion = 0
	var property altura = 0
	method horasDeSolToleradas(){
		return 7
	}

	method esFuerte(){
		return self.horasDeSolToleradas() > 9
	}
	method daNuevasSemilla(){
		return self.esFuerte()
	}

	method espacioOcupado()
	
	method parcelaEsIdeal(unaParcela)
	
	method seAsociaBien(unaParcela){
        		return unaParcela.esEcologicaPara(self) and 
        		unaParcela.esIndustrialPara(self)
    }
}

class Menta inherits Planta{
	override method horasDeSolToleradas(){
		return 6
		}
		//dice condicion alternativa
	override method daNuevasSemilla(){
		return super() or self.altura() > 0.4
	}
	override method espacioOcupado(){
		return self.altura() + 1 
	}
	override method parcelaEsIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
}
 
class Soja inherits Planta{
    	override method horasDeSolToleradas(){
     		return if (self.altura() < 0.5) {6}
        			    else if (self.altura().between(0.5, 1)) {8}
       				 else {12}
   	 }	

    	override method daNuevasSemilla(){
       		 return super() or self.anioDeObtencion() > 2007 and 
        				 self.altura().between(0.75, 0.9)
    	}
    	override method espacioOcupado(){
        		return self.altura() / 2 
        		}
        	 override method parcelaEsIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.horasDeSolToleradas()
	
	}

}	

class Quinoa inherits Planta{
    	const property espacioOcupado = 0
    	
    	override method horasDeSolToleradas(){
        		return if (espacioOcupado < 0.3) {10}
        			else{super() }}

    	override method daNuevasSemilla(){
        		return super() or self.anioDeObtencion().between(2001,2008)
    	}
    	//revisar
    	override method parcelaEsIdeal(unaParcela){
		return unaParcela.plantas().any({p => p.altura() <= 1.5})
	}
	
}

class SojaTransgenica inherits Soja{
	override  method daNuevasSemilla(){
		return false
	}
	//revisar
	override method parcelaEsIdeal(unaParcela){
		return unaParcela.plantas().size() == 1
	}
}

class HierbaBuena inherits Menta{
	override method espacioOcupado(){
		return super() * 2
	}
}







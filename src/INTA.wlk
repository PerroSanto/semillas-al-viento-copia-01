import plantas.*
import parcelas.*

object inta {
	const property parcelas = #{}
	
	method promedioDePlantas(){
		return parcelas.count({p => p.cantidadDePlantas()}) / parcelas.size()
	}

	method parcelaMasAutosustentable(){
		self.parcelasConMasDeCuatroPlantas() and self.mejorAsociada()
	}
	
	method parcelasConMasDeCuatroPlantas(){
		return parcelas.fiter({p => p.cantidadDePlantas() > 4})
	} 
	
	method mejorAsociada(){
        		return parcelas.max({p => p.porcentajeDeBienAsociadas()})
    }
}

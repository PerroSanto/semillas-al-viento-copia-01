import plantas.*
import parcelas.*

object inta {
	const property parcelas = #{}
	
	method promedioDePlantas(){
		return parcelas.count({p => p.cantidadDePlantas()}) / parcelas.size()
	}

	method parcelaMasAutosustentable(){
		return self.parcelasConMasDeCuatroPlantas().max({p => p.porcentajeDeBienAsociadas()})
	}
	
	method parcelasConMasDeCuatroPlantas(){
		return parcelas.fiter({p => p.cantidadDePlantas() > 4})
	} 
	
}
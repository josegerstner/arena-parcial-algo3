package dominio

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class Tarea {
	String description
	boolean estaHecho = false
	
	new(String desc){
		description = desc
	}
	
	def setEstaHecho(boolean _b){
		estaHecho = _b
	}
	
	def setearHecho(){
		if(estaHecho){
			estaHecho = false
		}else{
			estaHecho = true
		}
	}
	
	def getEstaHecho(){
		if(estaHecho){
			"SI"
		}else{
			"NO"
		}
	}
	
	override toString(){
		description
	}
}
package modelo

import dominio.Tarea
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class EditarTarea {
	Tarea tareaSeleccionada
	String nuevoNombre
	boolean estaHecho
	
	new(Tarea _tareaSeleccionada, String _nuevoNombre){
		tareaSeleccionada = _tareaSeleccionada
		nuevoNombre = _nuevoNombre
	}
	
	def boolean getEstaHecho(){
		if(tareaSeleccionada.estaHecho == "SI"){
			true
		}else{
			false
		}
	}
	
	@Dependencies("nuevoNombre")
	def setNuevoNombre(){
		tareaSeleccionada.setDescription(nuevoNombre)
	}
	
	@Dependencies("estaHecho")
	def setEstaHecho(){
		tareaSeleccionada.setEstaHecho(estaHecho)
	}
}
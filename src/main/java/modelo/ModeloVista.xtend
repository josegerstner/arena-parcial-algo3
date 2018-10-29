package modelo

import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import dominio.Tarea
import java.util.List

@Observable
@Accessors
class ModeloVista {
	var Tarea tareaSeleccionada
	var String tareaNueva
	var String nuevoNombre
	var List<Tarea> repo = newArrayList 
	val Tarea entregaTPAlgo3 = new Tarea("Entrega 1 Algo 3")
	val Tarea parcialAlgo3 = new Tarea("Parcial Algo 3")
	val Tarea estudiarDB = new Tarea("Estudiar para DB")
	
	new(){
		repo.add(entregaTPAlgo3)
		repo.add(parcialAlgo3)
		repo.add(estudiarDB)
	}
	
	@Dependencies("tareaNueva")
	def agregarTarea(){
		repo.add(new Tarea(tareaNueva))
	}
	
	@Dependencies("tareaSeleccionada")
	def setearHecho(){
		tareaSeleccionada.setearHecho
	}
	
	
	@Dependencies("tareaSeleccionada", "nuevoNombre")
	def editarTarea(){
		if(nuevoNombre == "" || nuevoNombre === null)
			nuevoNombre = tareaSeleccionada.description
		new EditarTarea(tareaSeleccionada, nuevoNombre)
	}
}
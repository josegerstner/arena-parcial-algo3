package vista

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import dominio.Tarea
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import modelo.ModeloVista
import org.uqbar.arena.windows.Dialog

class VistaTareas extends MainWindow<ModeloVista> {
	
	new() {
		super(new ModeloVista)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "TODO List"
		mainPanel.layout = new VerticalLayout
		
		val Panel panelSuperior = new Panel(mainPanel).layout = new ColumnLayout(2) 
		new TextBox(panelSuperior).value <=> "tareaNueva"
		new Button(panelSuperior) => [
			caption = "Agregar tarea"
			onClick(|this.modelObject.agregarTarea())
			setAsDefault
			disableOnError
		]
		
		new TextBox(panelSuperior).value <=> "nuevoNombre"
		new Button(panelSuperior) => [
			caption = "Editar tarea"
			onClick(|this.editar())
		]
		
		var tablaTareas = new Table<Tarea>(mainPanel, typeof(Tarea)) => [
			numberVisibleRows = 10
			items <=> "repo"
			value <=> "tareaSeleccionada"
		]
		new Column<Tarea>(tablaTareas) => [
			fixedSize = 240
			title = "Tarea"
			bindContentsToProperty("description")
		]
		new Column<Tarea>(tablaTareas) => [
			fixedSize = 240
			title = "Hecho"
			bindContentsToProperty("estaHecho")
		]
		
		new Button(mainPanel) => [
			caption = "Hacer/Deshacer"
			onClick(|this.modelObject.setearHecho())
		]
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
	
	
	def editar() {
		openDialog(new EditarTareaView(this, this.modelObject.editarTarea))
	}
	
	def static main(String[] args) {
		new VistaTareas().startApplication
	}
}
package vista

import org.uqbar.arena.aop.windows.TransactionalDialog
import modelo.EditarTarea
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.CheckBox

class EditarTareaView extends TransactionalDialog<EditarTarea>{
	
	new(WindowOwner owner, EditarTarea model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Editar tarea"
		
		var Panel columna = new Panel(mainPanel).layout = new ColumnLayout(2)
		new TextBox(columna).value <=> "nuevoNombre"
		new CheckBox(columna).value <=> "estaHecho"
		new Button(mainPanel) => [
			caption = "OK"
			onClick(|this.accept)
			setAsDefault
			disableOnError
		]
	}
	
}
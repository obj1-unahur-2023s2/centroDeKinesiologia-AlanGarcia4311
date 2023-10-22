import aparatos.*

class Paciente {
	var edad
	var property nivelDeFortaleza 
	var property nivelDeDolor
	const rutina = []
	
	
	method edad() = edad
	method asignarRutina(x) {
		rutina.addAll(x)
	}
	method puedeUsar(objeto) = objeto.puedeUsarlo(self)
	method usarObjeto(objeto) { if(self.puedeUsar(objeto)) objeto.usar(self) }
	method puedeHacerLaRutina() = rutina.all({x=>self.puedeUsar(x)})
	method sesionCompleta() { if(self.puedeHacerLaRutina()) rutina.forEach({x=>self.usarObjeto(x)}) }
	method irAlCentro() {}
	method cantidadDeAparatos() = rutina.size()
}

class PacienteResistente inherits Paciente{
	override method sesionCompleta() { 
		super() 
		self.nivelDeFortaleza(self.nivelDeFortaleza() + self.cantidadDeAparatos())
	}
}

class PacienteCaprichoso inherits Paciente{
	override method puedeHacerLaRutina() = super() and rutina.any({x=>x.color() == "rojo"})
	override method sesionCompleta() {
		super()
		super()
	}
}

class PacienteRapidaRecuperacion inherits Paciente{
	var decrementoDeDolor = 3
	
	method asignarDecremento(valor) { decrementoDeDolor = valor }
	override method sesionCompleta() {
		super()
		self.nivelDeDolor(0.max(self.nivelDeDolor() - decrementoDeDolor))
	}
}
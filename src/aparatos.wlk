import pacientes.*

class Aparatos {
	var color = "blanco"
	
	method color() = color 
	method necesitaMantenimiento() = false 
	method consecuenciasDeUso() {}
	method hacerMantenimiento() {}
}

class Magneto inherits Aparatos{
	var imantacion = 800
	
	method imantacion() = imantacion
	method puedeUsarlo(paciente) = true
	method usar(paciente) { 
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.9)
		self.consecuenciasDeUso()
	}
	override method necesitaMantenimiento() = imantacion < 100
	override method hacerMantenimiento() { if(self.necesitaMantenimiento()) imantacion = imantacion + 500 }
	override method consecuenciasDeUso() { imantacion -= 1 }
}

class Bicicleta inherits Aparatos{
	var cantidadDeDesajustes = 0 
	var vecesQuePierdeAceite = 0
	
	method puedeUsarlo(paciente) = paciente.edad() > 8 
	method usar(paciente) { 
		self.consecuenciasDeUso(paciente)
		paciente.nivelDeDolor(paciente.nivelDeDolor() - 4) 
		paciente.nivelDeFortaleza(paciente.nivelDeFortaleza() + 3) 
	}
	override method necesitaMantenimiento() = cantidadDeDesajustes >= 10 or vecesQuePierdeAceite >= 5 
	override method hacerMantenimiento() { 
		if(self.necesitaMantenimiento()) {
		cantidadDeDesajustes = 0
		vecesQuePierdeAceite = 0
		}
	}
	method consecuenciasDeUso(paciente) { 
		if (paciente.nivelDeDolor() > 30) cantidadDeDesajustes += 1
		if (paciente.edad().between(30, 50)) vecesQuePierdeAceite += 1 
	}
}

class Ministramp inherits Aparatos{
	method puedeUsarlo(paciente) = paciente.nivelDeDolor() < 20
	method usar(paciente) = paciente.nivelDeFortaleza(paciente.nivelDeFortaleza() + paciente.edad() * 0.1) 
}
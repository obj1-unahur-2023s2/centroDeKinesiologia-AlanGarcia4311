import aparatos.*
import pacientes.*

object centro {
	var aparatos = []
	var pacientes = []
	
	method colorDeAparatos() = aparatos.map({x=>x.color()}).asSet()
	method pacientesMenores() = pacientes.filter({x=>x.edad() < 8})
	method cantPacientesNoPuedenHacerRutina() = pacientes.filter({x=>not x.puedeHacerLaRutina()}).size()
	method estaOptimo() = aparatos.all({x=>not x.necesitaMantenimiento()})
	method estacomplicado() = aparatos.count({x=>x.necesitaMantenimiento()}) > (aparatos.size()/2)
	method visitaDelTecnico() = aparatos.forEach({x=>x.hacerMantenimiento()})
}

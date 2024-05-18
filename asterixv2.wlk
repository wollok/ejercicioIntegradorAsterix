import combatientes.*

class Grupo inherits Combatiente {
	const integrantes = []
	
	override method poder() = integrantes.filter(
		{ int => not int.fueraCombate() }
	).sum({ int => int.poder() })
	
	override method recibir(danio) {
		self.repartirDanio(danio)
	}
	
	method repartirDanio(danio) {
		const individual = danio / integrantes.size()
		integrantes.forEach({ int => int.recibir(individual) })
	}
}

class CampamentoFortificado inherits Grupo {
	var property formacion = cuadro
	
	override method poder() = formacion.poder(super())
	
	override method recibir(danio) {
		formacion.recibir(danio, self)
	}
}

object tortuga {
	method poder(poder) = 0
	
	method recibir(danio, legion) {
		
	}
}

object cuadro {
	method poder(poder) = poder
	
	method recibir(danio, legion) {
		legion.repartirDanio(danio / 2)
	}
}
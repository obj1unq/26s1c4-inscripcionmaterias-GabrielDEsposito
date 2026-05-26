class Estudiante {
    const materiasAprobadas = #{}
	const carreras = #{}
	const creditosTotales = 0

    method aprobar(materia, nota) {
      if (self.aprobo(materia)){
        self.error("...")
      }
      materiasAprobadas.add(new MateriaAprobada(materia = materia, nota = nota))
    }

	

	method aprobo(materia) = materiasAprobadas.any({ materiaAprobada => materiaAprobada.materia() == materia })
	


	method sumaDeMateriasAprobadas() = materiasAprobadas.sum({materia => MateriaAprobada.nota() })
	

	method promedio() =  materiasAprobadas.average({ materia => MateriaAprobada.nota() })

	method materiasQueEstaInscriptoDeCarreras() = carreras.materias().flatten()
	
	method cantMateriasAprobadas() = materiasAprobadas.size()

	method materiasTotales() = carreras.map({carrera => carrera.materias()}).flatten() //ver 
	
	method materiasQueSePuedeInscribir(carrera) {
		if(!carreras.contains(carrera))
			{self.error("No cursa esta carrera")}
		else
			carrera.materias().filter({materia => materia.puedeInscribirse(self)}) 
	} 

	method materiasInscripto() = self.materiasTotales().filter({materia => materia.estaInscripto(self)})
	
	method creditosTotales() = creditosTotales 

	
	

}	

class MateriaAprobada{
	const materia = null
	const nota = 0

	method materia() = materia
	method nota() = nota 
	
	
}

class Materia{
	const inscriptos = #{}
	const correlativas = #{}
	const listaDeEspera = []
	const cupo = 0
	
	method puedeInscribirse(estudiante) =  estudiante.materiasTotales().contains(self) and !estudiante.aprobo(self) and !self.estaInscripto(estudiante) and self.tieneAprobadasCorrelativas(estudiante)  // 

	method estaInscripto(estudiante) = inscriptos.contains(estudiante) 

	method inscribir(estudiante) {
		if(!self.puedeInscribirse(estudiante)){
			self.error("No cumple las condiciones")
		
		}
		self.verificarCupoParaInscribir(estudiante)	
	} 


	method verificarCupoParaInscribir(estudiante) {
      if(inscriptos.size() < cupo){
        inscriptos.add(estudiante)
      } else {
        listaDeEspera.add(estudiante)
      }
    }

	method tieneAprobadasCorrelativas(estudiante) = correlativas.all({materia => estudiante.aprobo(materia)})

	method darDeBaja(estudiante) {
      inscriptos.remove(estudiante)
      if(!listaDeEspera.isEmpty()){
        const primeroEnEspera = listaDeEspera.first()
        inscriptos.add(primeroEnEspera)
        listaDeEspera.remove(primeroEnEspera)
      }
    }

	method puedeHacerTrabajoFinal(estudiante) = estudiante.creditosTotales() > 250

	method inscriptos() = inscriptos // Los estudiantes inscriptos a una materia dada.
	method listaDeEspera() = listaDeEspera  // Los estudiantes en lista de espera para una materia dada.

	
}

class Carrera {
  const materias = #{}

  method materias() = materias 
  
}





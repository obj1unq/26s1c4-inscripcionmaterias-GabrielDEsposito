class Estudiante {
    const materiasAprobadas = #{}
	
    
    method cantMateriasAprobadas() = materiasAprobadas.size()

    method aprobar(materia, nota) {
      if (self.aprobo(materia)){
        self.error("...")
      }
      materiasAprobadas.add(new MateriaAprobada(materia = materia, nota = nota))
    }

	method aprobo(materia) = materiasAprobadas.any({}) //recibe bloque dentro del parentesis

	method promedio() =  self.cantMateriasAprobadas().average()

	/*method materiasTotales() = self.materiasAprobadas().flatten() */
	method estaYaInscripto(materia) {
		if(!estudiante.tieneCorrelativas(materia)){
			self.error("...")
		}

	}

}	

class MateriaAprobada{

	
}

class Materia{
	method puedeInscribirse(estudiante, materia) =  !estudiante.aprobo(materia) and !self.estaYaInscripto(materia) and self.tieneCorrelativas(materia)


	
}

class Carrera {
  
}





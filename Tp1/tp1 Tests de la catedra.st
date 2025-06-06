TestCase subclass: #AlgoOlimpicosTest
	instanceVariableNames: 'precision'
	classVariableNames: ''
	package: 'tp1 reentrega-Tests'!

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'JG 8/25/2024 20:04'!
test07EntreVariosAtletasDetectoAlMasDebil
	| atletaMasDebilEsperado atletaMasDebilObtenido algoOlimpicos  |
	
	"Arrange"	
	atletaMasDebilEsperado := 'Antonino Pizzolato'.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Debil'.
	
	algoOlimpicos registrarAtletaConNombre: 'Romain Imadouchene' dePeso: 96 yAltura: 1.83 yEdad: 28 yNacionalidad: 'Francia'.
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	algoOlimpicos registrarAtletaConNombre: 'Antonino Pizzolato' dePeso: 89 yAltura: 1.75 yEdad: 28 yNacionalidad: 'Italia'.
	algoOlimpicos registrarAtletaConNombre: 'Yu Dongju' dePeso: 88 yAltura: 1.77 yEdad: 31 yNacionalidad: 'Corea del Sur'.
	
	"Act"	
	atletaMasDebilObtenido := algoOlimpicos obtenerAtletaSegunCriterio.
	
	"Assert"
	self assert: atletaMasDebilEsperado equals: atletaMasDebilObtenido
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'lw 9/12/2024 17:03'!
test02UnAtletaDePaisLimitrofeConCiertoPesoYEdadPuedeLevantarCiertosKilos		
	| pesoMaximoEsperado pesoMaximoObtenido algoOlimpicos  |
	
	"Arrange"	
	pesoMaximoEsperado := 128.493.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	"El atleta es de un pais limitrofe a Francia por lo que el apoyo del publico lo ayuda. Va a poder levantar un 10% mas"
	"Debido a que es joven (de 30 años o menos), puede levantar un peso que corresponde a su peso multiplicado por su altura, y luego multiplicado por la diferencia entre su altura y uno."
	algoOlimpicos registrarAtletaConNombre: 'Antonino Pizzolato' dePeso: 89 yAltura: 1.75 yEdad: 28 yNacionalidad: 'Italia'.
	
	"Act"	
	pesoMaximoObtenido := algoOlimpicos pesoMaximoDe: 'Antonino Pizzolato'.
	
	"Assert"
	self assert: (pesoMaximoObtenido compararCon: pesoMaximoEsperado precision: precision )
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'JG 8/25/2024 20:03'!
test04EntreUnAtletaYOtroDetectaAlMasFuerte
	| atletaMasFuerteEsperado atletaMasFuerteObtenido algoOlimpicos  |
	
	"Arrange"	
	atletaMasFuerteEsperado := 'Lasha Talakhadze'.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	algoOlimpicos registrarAtletaConNombre: 'Romain Imadouchene' dePeso: 96 yAltura: 1.83 yEdad: 28 yNacionalidad: 'Francia'.
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	
	"Act"	
	atletaMasFuerteObtenido := algoOlimpicos obtenerAtletaSegunCriterio.
	
	"Assert"
	self assert: atletaMasFuerteEsperado equals: atletaMasFuerteObtenido
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'lw 9/12/2024 17:03'!
test01UnAtletaConCiertoPesoYEdadPuedeLevantarCiertosKilos		
	| pesoMaximoEsperado pesoMaximoObtenido algoOlimpicos |
	
	"Arrange"	
	pesoMaximoEsperado := 286.635.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	"El atleta es de un pais lejano a Francia por lo que no lo apoya mucha gente." 
	"Debido a que es joven (de 30 años o menos), puede levantar un peso que corresponde a su peso multiplicado por su altura, y luego multiplicado por la diferencia entre su altura y uno."
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	
	"Act"	
	pesoMaximoObtenido := algoOlimpicos pesoMaximoDe: 'Lasha Talakhadze'.
		
	"Assert"
	self assert: (pesoMaximoObtenido compararCon: pesoMaximoEsperado precision: precision )
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'lw 9/12/2024 17:03'!
test03UnAtletaFrancesConCiertoPesoYEdadPuedeLevantarCiertosKilos		
	| pesoMaximoEsperado pesoMaximoObtenido algoOlimpicos  |
	
	"Arrange"	
	pesoMaximoEsperado := 182.268.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	"El atleta es de Francia por lo que mucha gente lo va a apoyar. Va a poder levantar un 25% mas"
	"Debido a que es joven (de 30 años o menos), puede levantar un peso que corresponde a su peso multiplicado por su altura, y luego multiplicado por la diferencia entre su altura y uno."
	algoOlimpicos registrarAtletaConNombre: 'Romain Imadouchene' dePeso: 96 yAltura: 1.83 yEdad: 28 yNacionalidad: 'Francia'.
	
	"Act"	
	pesoMaximoObtenido := algoOlimpicos pesoMaximoDe: 'Romain Imadouchene'.
	
	"Assert"
	self assert: (pesoMaximoObtenido compararCon: pesoMaximoEsperado precision: precision )
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'lw 9/12/2024 17:03'!
test05UnAtletaVeteranoConCiertoPesoYEdadPuedeLevantarCiertosKilos		
	| pesoMaximoEsperado pesoMaximoObtenido algoOlimpicos  |
	
	"Arrange"	
	pesoMaximoEsperado := 155.76.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	"El atleta es de un pais lejano a Francia por lo que no lo apoya mucha gente." 
	"Debido a que es veterano (31 años o mas), puede levantar un peso que corresponde a su peso multiplicado por su altura"
	algoOlimpicos registrarAtletaConNombre: 'Yu Dongju' dePeso: 88 yAltura: 1.77 yEdad: 31 yNacionalidad: 'Corea del Sur'.
	
	"Act"	
	pesoMaximoObtenido := algoOlimpicos pesoMaximoDe: 'Yu Dongju'.
	
	"Assert"
	self assert: (pesoMaximoObtenido compararCon: pesoMaximoEsperado precision: precision )
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'JG 8/25/2024 20:04'!
test06EntreVariosAtletasDetectoAlMasFuerte
	| atletaMasFuerteEsperado atletaMasFuerteObtenido algoOlimpicos  |
	
	"Arrange"	
	atletaMasFuerteEsperado := 'Lasha Talakhadze'.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	algoOlimpicos registrarAtletaConNombre: 'Romain Imadouchene' dePeso: 96 yAltura: 1.83 yEdad: 28 yNacionalidad: 'Francia'.
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	algoOlimpicos registrarAtletaConNombre: 'Antonino Pizzolato' dePeso: 89 yAltura: 1.75 yEdad: 28 yNacionalidad: 'Italia'.
	algoOlimpicos registrarAtletaConNombre: 'Yu Dongju' dePeso: 88 yAltura: 1.77 yEdad: 31 yNacionalidad: 'Corea del Sur'.
	
	"Act"	
	atletaMasFuerteObtenido := algoOlimpicos obtenerAtletaSegunCriterio.
	
	"Assert"
	self assert: atletaMasFuerteEsperado equals: atletaMasFuerteObtenido
! !

!AlgoOlimpicosTest methodsFor: 'tests' stamp: 'lw 9/12/2024 17:04'!
test08UnAtletaConCiertoPesoYEdadPuedeLevantarCiertosKilosEnLaLuna		
	
	"Arrange"	
	| pesoEnLunaEsperado algoOlimpicos pesoMaximoObtenido |
	pesoEnLunaEsperado := 47.48.
	algoOlimpicos  := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	"El atleta es de un pais lejano a Francia por lo que no lo apoya mucha gente." 
	"Debido a que es joven (de 30 años o menos), puede levantar un peso que corresponde a su peso multiplicado por su altura, y luego multiplicado por la diferencia entre su altura y uno."
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	
	"Act"	
	pesoMaximoObtenido := algoOlimpicos pesoMaximoDe: 'Lasha Talakhadze'.
		
	"Assert"
	"Peso en la Luna = Peso en la Tierra × (1.625 / 9.81)"
	self assert: (pesoMaximoObtenido compararPesoEnLunaCon: pesoEnLunaEsperado  precision: precision )
! !


!AlgoOlimpicosTest methodsFor: 'running' stamp: 'JG 8/25/2024 20:22'!
setUp
	super setUp.
	precision := 1e-3.
	"Put here a common initialization logic for tests"! !

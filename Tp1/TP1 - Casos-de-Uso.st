TestCase subclass: #AlgoOlimpicosTests
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1 - Casos-de-Uso'!

!AlgoOlimpicosTests methodsFor: 'tests' stamp: 'AF 9/26/2024 17:21'!
test03SeRegistraUnAtletaTieneUnaPesoInvalido
	| unBloque |
	
	"Act"
	unBloque := [AlgoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: -150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.].
	
	"Assert"
	self should: unBloque raise: PesoInvalidoError.
! !

!AlgoOlimpicosTests methodsFor: 'tests' stamp: 'AF 9/26/2024 17:21'!
test01SeRegistraUnAtletaTieneUnaAlturaInvalida
	| unBloque |
	
	"Act"
	unBloque := [AlgoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: -1.97 yEdad: 30 yNacionalidad: 'Georgia'.].
	
	"Assert"
	self should: unBloque raise: AlturaInvalidaError.
! !

!AlgoOlimpicosTests methodsFor: 'tests' stamp: 'AF 9/26/2024 17:21'!
test02SeRegistraUnAtletaTieneUnaEdadInvalida
	| unBloque |
	
	"Act"
	unBloque := [AlgoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: -30 yNacionalidad: 'Georgia'.].
	
	"Assert"
	self should: unBloque raise: EdadInvalidaError.
! !


TestCase subclass: #AtletaTests
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1 - Casos-de-Uso'!

!AtletaTests methodsFor: 'tests' stamp: 'AF 9/26/2024 16:26'!
test01UnAtletaSabeIndicarSuNombre
	| nombreEsperado nombreObtenido atleta |

	"Arrange"	
	nombreEsperado := 'Lasha Talakhadze'.
	atleta := Atleta conNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	
	"Act"
	nombreObtenido := atleta obtenerNombre.
	
	"Assert"
	self assert: nombreObtenido equals: nombreEsperado! !

!AtletaTests methodsFor: 'tests' stamp: 'AF 10/13/2024 20:48'!
test03UnAtletaDe28AniosYPeso89YAltura1Punto75TienePesoMaximo116Punto813
	| pesoMaximoEsperado pesoMaximoObtenido atleta |

	"Arrange"	
	pesoMaximoEsperado := 116.8125.
	
	atleta := Atleta conNombre: 'Antonino Pizzolato' dePeso: 89 yAltura: 1.75 yEdad: 28 yNacionalidad: 'Georgia'.
	
	"Act"
	pesoMaximoObtenido := atleta obtenerPesoMaximo.
	
	"Assert"
	self assert: pesoMaximoObtenido equals: pesoMaximoEsperado ! !

!AtletaTests methodsFor: 'tests' stamp: 'AF 10/13/2024 20:48'!
test04UnAtletaDe31AniosYPeso88YAltura1Punto77TienePesoMaximo155Punto76
	| pesoMaximoEsperado pesoMaximoObtenido atleta |
	
	"Arrange"	
	pesoMaximoEsperado := 155.76.
	
	atleta := Atleta conNombre: 'Yu Dongju' dePeso: 88 yAltura: 1.77 yEdad: 31 yNacionalidad: 'Corea del Sur'.
	
	"Act"
	pesoMaximoObtenido := atleta obtenerPesoMaximo.
	
	"Assert"
	self assert: pesoMaximoObtenido equals: pesoMaximoEsperado ! !

!AtletaTests methodsFor: 'tests' stamp: 'AF 9/26/2024 16:36'!
test06UnAtletaTieneUnaAlturaInvalida
	| unBloque |
	
	"Act"
	unBloque := [Atleta conNombre: 'Yu Dongju' dePeso: 88 yAltura: -1.77 yEdad: 31 yNacionalidad: 'Corea del Sur'.].
	
	"Assert"
	self should: unBloque raise: AlturaInvalidaError.! !

!AtletaTests methodsFor: 'tests' stamp: 'AF 9/26/2024 17:17'!
test08UnAtletaTieneUnaEdadInvalida
	| unBloque |
	
	"Act"
	unBloque := [Atleta conNombre: 'Yu Dongju' dePeso: 88 yAltura: 1.77 yEdad: -31 yNacionalidad: 'Corea del Sur'.].
	
	"Assert"
	self should: unBloque raise: EdadInvalidaError.! !

!AtletaTests methodsFor: 'tests' stamp: 'AF 10/13/2024 20:47'!
test02UnAtletaDe30AniosYPeso150YAltura1Punto97TienePesoMaximo286Punto635
	| pesoMaximoEsperado pesoMaximoObtenido atleta precision|
	
	"Arrange"	
	precision := 0.001.
	pesoMaximoEsperado := 286.635.
	
	atleta := Atleta conNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
	
	"Act"
	pesoMaximoObtenido := atleta obtenerPesoMaximo.
	
	"Assert"
	self assert: pesoMaximoObtenido equals: pesoMaximoEsperado ! !

!AtletaTests methodsFor: 'tests' stamp: 'AF 9/26/2024 16:37'!
test07UnAtletaTieneUnPesoInvalido
	| unBloque |
	
	"Act"
	unBloque := [Atleta conNombre: 'Yu Dongju' dePeso: -88 yAltura: 1.77 yEdad: 31 yNacionalidad: 'Corea del Sur'.].
	
	"Assert"
	self should: unBloque raise: PesoInvalidoError.! !


TestCase subclass: #CriterioTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1 - Casos-de-Uso'!

!CriterioTest methodsFor: 'tests' stamp: 'af 9/25/2024 21:16'!
test04UnaOlimpiadaConAtletasIncriptosTieneCriterioDebil
	| algoOlimpicos nombreEsperado nombreObtenido|
	
	"Arrange"
	nombreEsperado := 'Lasha Talakhadze'.
	algoOlimpicos := AlgoOlimpicos conCriterioMas: 'Debil'.
	
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
algoOlimpicos registrarAtletaConNombre: 'Romain Imadouchene' dePeso: 150 yAltura: 1.97 yEdad: 28 yNacionalidad: 'Francia'.

	"Act"
	nombreObtenido := algoOlimpicos obtenerAtletaSegunCriterio.
	
	"Assert"
	self assert: nombreObtenido equals: nombreEsperado! !

!CriterioTest methodsFor: 'tests' stamp: 'AF 9/26/2024 16:11'!
test03UnaOlimpiadaNoTieneAtletasInscriptos
	| algoOlimpicos unBloque |

	"Arrange"
	algoOlimpicos := AlgoOlimpicos conCriterioMas: 'Debil'.
	
	"Act"
	unBloque := [algoOlimpicos obtenerAtletaSegunCriterio  ].
	
	"Assert"
	self should: unBloque raise: AtletasNoInscriptosError .! !

!CriterioTest methodsFor: 'tests' stamp: 'af 9/25/2024 21:03'!
test05UnaOlimpiadaConAtletasIncriptosTieneCriterioFuerte
	| algoOlimpicos nombreEsperado nombreObtenido|
	
	"Arrange"
	nombreEsperado := 'Romain Imadouchene'.
	algoOlimpicos := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 1.97 yEdad: 30 yNacionalidad: 'Georgia'.
algoOlimpicos registrarAtletaConNombre: 'Romain Imadouchene' dePeso: 150 yAltura: 1.97 yEdad: 28 yNacionalidad: 'Francia'.

	"Act"
	nombreObtenido := algoOlimpicos obtenerAtletaSegunCriterio.
	
	"Assert"
	self assert: nombreObtenido equals: nombreEsperado! !

!CriterioTest methodsFor: 'tests' stamp: 'AF 9/26/2024 16:12'!
test01UnaOlimpiadaTieneCriterioInvalido
	| unBloque |
		
	"Act"
	unBloque := [AlgoOlimpicos conCriterioMas: 'Alto' ].
	
	"Assert"
	self should: unBloque raise: CriterioInvalidoError .! !

!CriterioTest methodsFor: 'tests' stamp: 'AF 9/26/2024 16:10'!
test02UnaOlimpiadaTieneCriterioFuerte
	| unBloque |
	
	"Act"
	unBloque := [ AlgoOlimpicos conCriterioMas: 'Fuerte' ].
	
	"Assert"
	self shouldnt: unBloque raise: CriterioInvalidoError.! !


TestCase subclass: #PesoMaximoTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1 - Casos-de-Uso'!

!PesoMaximoTest methodsFor: 'tests' stamp: 'AF 10/15/2024 13:19'!
test02UnAtletaDeFranciaComparaSuPesoMaximoConCiertaPrecision	
	| pesoMaximoEsperado pesoMaximoObtenido atleta |
	
	"Arrange"	
	atleta := Atleta conNombre: 'Lasha Talakhadze' dePeso: 96 yAltura: 1.83 yEdad: 28 yNacionalidad: 'Francia'.
	pesoMaximoEsperado := 182.268.

	"Act"
	pesoMaximoObtenido  :=  atleta pesoMaximo.
	
	"Assert"
	self assert: (pesoMaximoObtenido compararCon: pesoMaximoEsperado precision: 0.001 )! !

!PesoMaximoTest methodsFor: 'tests' stamp: 'AF 10/15/2024 13:18'!
test01UnAtletaComparaSuPesoMaximoEnLaLunaConPrecisionDe001	
	| pesoEnLunaEsperado algoOlimpicos pesoMaximoObtenido |
	
	"Arrange"
	pesoEnLunaEsperado := 49.69.
	algoOlimpicos := AlgoOlimpicos conCriterioMas: 'Fuerte'.
	
	algoOlimpicos registrarAtletaConNombre: 'Lasha Talakhadze' dePeso: 150 yAltura: 2 yEdad: 30 yNacionalidad: 'Georgia'.
	
	"Act"	
	pesoMaximoObtenido := algoOlimpicos pesoMaximoDe: 'Lasha Talakhadze'.
		
	"Assert"
	self assert: (pesoMaximoObtenido compararPesoEnLunaCon: pesoEnLunaEsperado precision:  0.01 ) 

	

	! !

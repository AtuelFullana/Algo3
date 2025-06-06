Object subclass: #AlgoOlimpicos
	instanceVariableNames: 'atletas criterio'
	classVariableNames: ''
	package: 'TP1'!

!AlgoOlimpicos methodsFor: 'as yet unclassified' stamp: 'AF 9/23/2024 14:43'!
conCriterioMas: unAtributo
	criterio := Criterio conAtributo: unAtributo.! !

!AlgoOlimpicos methodsFor: 'as yet unclassified' stamp: 'AF 9/26/2024 01:11'!
registrarAtletaConNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad
	| atleta |
	atleta := Atleta conNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad.
	atletas add: atleta.! !

!AlgoOlimpicos methodsFor: 'as yet unclassified' stamp: 'AF 9/24/2024 10:57'!
initialize 
	atletas := OrderedCollection new.! !


!AlgoOlimpicos methodsFor: 'not defined category' stamp: 'AF 10/13/2024 20:11'!
pesoMaximoDe: unNombre
	| atleta |
	atleta := atletas detect: [ :unAtleta | unAtleta tieneNombre: unNombre].
	^atleta pesoMaximo.! !

!AlgoOlimpicos methodsFor: 'not defined category' stamp: 'AF 9/24/2024 16:39'!
obtenerAtletaSegunCriterio
	^criterio obtenerAtletaSegunCriterio: atletas.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

AlgoOlimpicos class
	instanceVariableNames: ''!

!AlgoOlimpicos class methodsFor: 'not defined category' stamp: 'AF 9/24/2024 16:39'!
conCriterioMas: unAtributo
	| algoOlimpicos |
	algoOlimpicos := self new.
	algoOlimpicos conCriterioMas: unAtributo.
	^algoOlimpicos.! !

!AlgoOlimpicos class methodsFor: 'not defined category' stamp: 'AF 9/26/2024 17:29'!
registrarAtletaConNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad
	| algoOlimpicos |
	algoOlimpicos := self new.
	algoOlimpicos registrarAtletaConNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad.! !


Error subclass: #AlturaInvalidaError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

Object subclass: #Atleta
	instanceVariableNames: 'nombre peso edad altura nacionalidad'
	classVariableNames: ''
	package: 'TP1'!

!Atleta methodsFor: 'not defined category' stamp: 'AF 9/26/2024 16:59'!
numeroPositivo: unNumero
	^(unNumero > 0).! !

!Atleta methodsFor: 'not defined category' stamp: 'AF 9/26/2024 23:15'!
conNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad
	nombre := unNombre.
	(self numeroPositivo: unPeso) ifTrue: [peso := unPeso] ifFalse:  [ PesoInvalidoError signal].
	(self numeroPositivo: unaAltura) ifTrue: [altura := unaAltura] ifFalse:  [ AlturaInvalidaError signal].
	edad := Edad deCategoria: unaEdad.
	nacionalidad := Pais deNacionalidad: unaNacionalidad.
	! !

!Atleta methodsFor: 'not defined category' stamp: 'AF 10/15/2024 17:47'!
obtenerPesoMaximo
	^self pesoMaximo obtenerPesoMaximo.! !

!Atleta methodsFor: 'not defined category' stamp: 'AF 10/15/2024 13:06'!
pesoMaximo
  ^PesoMaximo deUnPeso: peso unaAltura: altura unaEdad: edad yUnaNacionalidad: nacionalidad.! !

!Atleta methodsFor: 'not defined category' stamp: 'AF 9/26/2024 01:22'!
obtenerNombre
	^nombre.
	! !

!Atleta methodsFor: 'not defined category' stamp: 'AF 9/24/2024 16:40'!
tieneNombre: unNombre
	^( nombre = unNombre ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Atleta class
	instanceVariableNames: ''!

!Atleta class methodsFor: 'not defined category' stamp: 'AF 9/26/2024 17:31'!
conNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad
	| unAtleta |
	unAtleta := self new.
	unAtleta conNombre: unNombre dePeso: unPeso yAltura: unaAltura yEdad: unaEdad yNacionalidad: unaNacionalidad.
	^unAtleta.! !


Error subclass: #AtletasNoInscriptosError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

Object subclass: #Criterio
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Criterio methodsFor: 'as yet unclassified' stamp: 'AF 9/23/2024 17:32'!
obtenerAtletaSegunCriterio: atletas
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Criterio class
	instanceVariableNames: ''!

!Criterio class methodsFor: 'not defined category' stamp: 'AF 9/24/2024 15:22'!
conAtributo: unAtributo
	(unAtributo = 'Fuerte') ifTrue: [ ^Fuerte new. ].
	(unAtributo = 'Debil') ifTrue: [ ^Debil new. ].
	CriterioInvalidoError signal.! !


Error subclass: #CriterioInvalidoError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

Criterio subclass: #Debil
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Debil methodsFor: 'not defined category' stamp: 'AF 10/13/2024 20:35'!
obtenerAtletaSegunCriterio: unosAtletas
	| atletaDebil |
	atletaDebil := unosAtletas  detectMin: [ :atleta | atleta obtenerPesoMaximo ].
	atletaDebil ifNil: [ AtletasNoInscriptosError signal ].
	^atletaDebil obtenerNombre.! !


Object subclass: #Edad
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Edad methodsFor: 'as yet unclassified' stamp: 'AF 9/24/2024 10:56'!
conPesoMaximoConPeso: unPeso YAltura: unaAltura
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Edad class
	instanceVariableNames: ''!

!Edad class methodsFor: 'not defined category' stamp: 'AF 9/26/2024 23:13'!
deCategoria: unaEdad
	(unaEdad < 0) ifTrue: [ EdadInvalidaError signal].
	(unaEdad < 31) ifTrue: [ ^Joven new ].
	^Veterano new.! !


Error subclass: #EdadInvalidaError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

Criterio subclass: #Fuerte
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Fuerte methodsFor: 'not defined category' stamp: 'AF 10/13/2024 20:35'!
obtenerAtletaSegunCriterio: unosAtletas
	| atletaFuerte |
	atletaFuerte := unosAtletas  detectMax: [ :atleta | atleta obtenerPesoMaximo ].
	atletaFuerte ifNil: [ AtletasNoInscriptosError signal ].
	^atletaFuerte obtenerNombre.! !


Edad subclass: #Joven
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Joven methodsFor: 'not defined category' stamp: 'AF 9/27/2024 00:49'!
conPesoMaximoConPeso: unPeso YAltura: unaAltura
	^(unPeso * unaAltura)*(unaAltura-1).! !


Object subclass: #Pais
	instanceVariableNames: 'paisesVecinos'
	classVariableNames: ''
	package: 'TP1'!

!Pais methodsFor: 'as yet unclassified' stamp: 'AF 9/23/2024 20:05'!
conPesoMaximo: unPeso
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Pais class
	instanceVariableNames: 'paisesVecinos atletas'!

!Pais class methodsFor: 'not defined category' stamp: 'AF 9/24/2024 10:55'!
deNacionalidad: unaNacionalidad
	| pais|
	(unaNacionalidad = 'Francia') ifTrue: [ ^Francia new. ].
	pais := paisesVecinos select: [ :paisVecino | paisVecino = unaNacionalidad ]. 
	(pais isNotEmpty) ifTrue: [ ^PaisVecino new.].
	^PaisLejano new.! !

!Pais class methodsFor: 'not defined category' stamp: 'AF 10/14/2024 21:17'!
initialize
	paisesVecinos := OrderedCollection new.
	paisesVecinos add: 'España'.
	paisesVecinos add: 'Andorra'.
	paisesVecinos add: 'Belgica'.
	paisesVecinos add: 'Luxemburgo'.
	paisesVecinos add: 'Italia'.
	paisesVecinos add: 'Alemania'.
	paisesVecinos add: 'Suiza'.! !


Pais subclass: #Francia
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Francia methodsFor: 'not defined category' stamp: 'AF 10/14/2024 20:27'!
conPesoMaximo: unPeso
	^unPeso * 1.25.! !


Pais subclass: #PaisLejano
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!PaisLejano methodsFor: 'not defined category' stamp: 'AF 10/14/2024 20:27'!
conPesoMaximo: unPeso
	^unPeso.! !


Pais subclass: #PaisVecino
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!PaisVecino methodsFor: 'not defined category' stamp: 'AF 10/14/2024 20:27'!
conPesoMaximo: unPeso
	^unPeso * 1.10.! !


Error subclass: #PesoInvalidoError
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

Object subclass: #PesoMaximo
	instanceVariableNames: 'peso altura nacionalidad edad'
	classVariableNames: ''
	package: 'TP1'!

!PesoMaximo methodsFor: 'not defined category' stamp: 'AF 10/15/2024 13:03'!
compararPesoEnLunaCon: otroPeso precision: unaPrecision
	^( self pesoEnLuna - otroPeso ) abs < unaPrecision.! !

!PesoMaximo methodsFor: 'not defined category' stamp: 'AF 10/15/2024 13:04'!
pesoEnLuna
	^self obtenerPesoMaximo * (1.625 / 9.81).! !

!PesoMaximo methodsFor: 'not defined category' stamp: 'AF 10/15/2024 13:08'!
obtenerPesoMaximo
  | unPesoSegunPaisYEdad unPesoSegunEdad|
  unPesoSegunEdad := edad conPesoMaximoConPeso: peso YAltura: altura.
  unPesoSegunPaisYEdad := nacionalidad conPesoMaximo: unPesoSegunEdad.
  ^unPesoSegunPaisYEdad.! !

!PesoMaximo methodsFor: 'not defined category' stamp: 'AF 10/15/2024 13:03'!
compararCon: otroPeso precision: unaPrecision
	^( self obtenerPesoMaximo - otroPeso ) abs < unaPrecision.! !


!PesoMaximo methodsFor: 'as yet unclassified' stamp: 'AF 10/15/2024 15:24'!
deUnPeso: unPeso unaAltura: unaAltura unaEdad: unaEdad yUnaNacionalidad: unaNacionalidad
	peso := unPeso.
	altura := unaAltura.
	nacionalidad := unaNacionalidad.
	edad := unaEdad.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

PesoMaximo class
	instanceVariableNames: 'pesoMaximo peso altura nacinoalidad'!

!PesoMaximo class methodsFor: 'not defined category' stamp: 'AF 10/15/2024 15:34'!
deUnPeso: unPeso unaAltura: unaAltura unaEdad: unaEdad yUnaNacionalidad: unaNacionalidad
	| unPesoMaximo |
	unPesoMaximo := self new.
	unPesoMaximo deUnPeso: unPeso unaAltura: unaAltura unaEdad: unaEdad yUnaNacionalidad: unaNacionalidad.
	^unPesoMaximo.! !


Edad subclass: #Veterano
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Veterano methodsFor: 'not defined category' stamp: 'AF 9/27/2024 00:49'!
conPesoMaximoConPeso: unPeso YAltura: unaAltura
	^unPeso * unaAltura.! !

Pais initialize!

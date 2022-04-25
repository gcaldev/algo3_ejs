!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: ''!

!AvispaLara class methodsFor: 'funcionamiento avispa' stamp: 'gmcb 4/24/2022 16:55:57'!
incubarHuevo
	HabitatDeAvispas agregarUnHuevoDeAvispaLara.! !

!AvispaLara class methodsFor: 'funcionamiento avispa' stamp: 'gmcb 4/25/2022 16:14:51'!
intentarReproducirse
	HabitatDeAvispas hayUnHuevoDeOrianaUOrnella ifTrue:[
			HabitatDeAvispas eliminarUnHuevoDeOrianaUOrnella.
			self incubarHuevo.
		] ifFalse:[
		HabitatDeAvispas  hayUnHuevoDePolly ifTrue:[
			HabitatDeAvispas eliminarUnHuevoDePolly.
			self incubarHuevo.
			]
		]
	
	! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'funcionamiento avispa' stamp: 'SMB 4/23/2022 17:21:16'!
incubarHuevo
	HabitatDeAvispas eliminarUnaOruga.
	HabitatDeAvispas agregarUnHuevoDeAvispaOrianaYOrnella .! !

!AvispaOriana class methodsFor: 'funcionamiento avispa' stamp: 'gmcb 4/25/2022 16:16:10'!
intentarReproducirse
	HabitatDeAvispas hayUnaOruga ifTrue: [ self incubarHuevo ].! !


!classDefinition: #AvispaOrnella category: 'AvispasYAbejasParte2'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #AvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'AvispasYAbejasParte2'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'funcionamiento avispa' stamp: 'SMB 4/23/2022 17:22:44'!
incubarHuevo
	HabitatDeAvispas eliminarUnaPolilla.
	HabitatDeAvispas agregarUnHuevoDeAvispaPolly .! !

!AvispaPolly class methodsFor: 'funcionamiento avispa' stamp: 'gmcb 4/25/2022 16:16:42'!
intentarReproducirse
	HabitatDeAvispas hayUnaPolilla ifTrue: [ self incubarHuevo ].! !


!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeAvispas cantidadDeOrugas cantidadDePolillas'!

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:31:28'!
agregarUnHuevoDeAvispaLara
	cantidadDeHuevosDeAvispas at: 'Lara' put: 1.! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:21:30'!
agregarUnHuevoDeAvispaOrianaYOrnella
	cantidadDeHuevosDeAvispas at: 'OrianaUOrnella' put: (self cantidadDeHuevosOrianaUOrnella + 1).! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:22:31'!
agregarUnHuevoDeAvispaPolly
	cantidadDeHuevosDeAvispas at: 'Polly' put: (self cantidadDeHuevosPolly + 1).! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:10:58'!
cantidadDeHuevosDeAvispas
	|cantidadDeHuevosTotales|.
	cantidadDeHuevosTotales := 0.
	cantidadDeHuevosTotales := cantidadDeHuevosTotales + cantidadDeHuevosDeAvispas at: 'OrianaUOrnella'.
	cantidadDeHuevosTotales := cantidadDeHuevosTotales + cantidadDeHuevosDeAvispas at: 'Polly'.
	^cantidadDeHuevosTotales .
	! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:32:21'!
cantidadDeHuevosLara
		^cantidadDeHuevosDeAvispas at: 'Lara'.! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:18:14'!
cantidadDeHuevosOrianaUOrnella
		^cantidadDeHuevosDeAvispas at: 'OrianaUOrnella'.! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:18:22'!
cantidadDeHuevosPolly
		^cantidadDeHuevosDeAvispas at: 'Polly'.! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'gmcb 4/24/2022 21:08:09'!
eliminarTodosLosHuevosDeAvispas
	cantidadDeHuevosDeAvispas := Dictionary new.
	cantidadDeHuevosDeAvispas at: 'OrianaUOrnella' put: 0.
	cantidadDeHuevosDeAvispas at: 'Polly' put: 0.
	cantidadDeHuevosDeAvispas at: 'Lara' put: 0.! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'gmcb 4/24/2022 16:59:56'!
eliminarUnHuevoDeOrianaUOrnella
	cantidadDeHuevosDeAvispas at: 'OrianaUOrnella' put:(self cantidadDeHuevosOrianaUOrnella - 1).! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'gmcb 4/24/2022 17:12:02'!
eliminarUnHuevoDePolly
	cantidadDeHuevosDeAvispas at: 'Polly' put:(self cantidadDeHuevosPolly - 1).! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:47:01'!
hayUnHuevoDeOrianaUOrnella
	^self cantidadDeHuevosOrianaUOrnella > 0! !

!HabitatDeAvispas class methodsFor: 'interaccion huevo' stamp: 'SMB 4/23/2022 17:48:07'!
hayUnHuevoDePolly
	^self cantidadDeHuevosPolly > 0! !


!HabitatDeAvispas class methodsFor: 'interaccion polilla' stamp: 'gmcb 4/23/2022 16:18:55'!
agregarPolilla
	cantidadDePolillas := cantidadDePolillas + 1! !

!HabitatDeAvispas class methodsFor: 'interaccion polilla' stamp: 'gmcb 4/23/2022 16:20:20'!
cantidadDePolillas
	^cantidadDePolillas.! !

!HabitatDeAvispas class methodsFor: 'interaccion polilla' stamp: 'gmcb 4/24/2022 21:07:09'!
eliminarTodasLasPolillas
	cantidadDePolillas := 0.! !

!HabitatDeAvispas class methodsFor: 'interaccion polilla' stamp: 'SMB 4/23/2022 16:50:25'!
eliminarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !

!HabitatDeAvispas class methodsFor: 'interaccion polilla' stamp: 'gmcb 4/23/2022 16:15:49'!
hayUnaPolilla
	^cantidadDePolillas  > 0.! !


!HabitatDeAvispas class methodsFor: 'interaccion oruga' stamp: 'gmcb 4/23/2022 15:33:46'!
agregarOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.
	! !

!HabitatDeAvispas class methodsFor: 'interaccion oruga' stamp: 'gmcb 4/23/2022 14:17:34'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'interaccion oruga' stamp: 'gmcb 4/24/2022 21:07:41'!
eliminarTodasLasOrugas
	cantidadDeOrugas := 0.! !

!HabitatDeAvispas class methodsFor: 'interaccion oruga' stamp: 'SMB 4/23/2022 16:45:21'!
eliminarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatDeAvispas class methodsFor: 'interaccion oruga' stamp: 'gmcb 4/23/2022 16:00:32'!
hayUnaOruga
	^cantidadDeOrugas > 0! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'gmcb 4/25/2022 16:20:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispas := ((Dictionary new) add: ('Lara'->0); add: ('OrianaUOrnella'->0); add: ('Polly'->0); yourself).
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SMB 4/23/2022 17:32:48'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^HabitatDeAvispas cantidadDeHuevosLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SMB 4/23/2022 17:23:41'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^HabitatDeAvispas cantidadDeHuevosOrianaUOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SMB 4/23/2022 17:24:43'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^HabitatDeAvispas cantidadDeHuevosOrianaUOrnella.
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SMB 4/23/2022 17:24:17'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^HabitatDeAvispas cantidadDeHuevosPolly .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/24/2022 20:44:25'!
habitat
	^ HabitatDeAvispas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:18:37'!
hacerQueElHabitatTengaLosRecursosSuficientes
	HabitatDeAvispas agregarOruga.
	HabitatDeAvispas agregarOruga.
	HabitatDeAvispas agregarPolilla.
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SMB 4/23/2022 17:29:17'!
laAvispaLara
	^AvispaLara .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/21/2022 19:50:23'!
laAvispaOriana
	^ AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:08:22'!
laAvispaOrnella
	^AvispaOrnella.
! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:11:32'!
laAvispaPolly
	^AvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 15:36:09'!
queElHabitatTengaDosOrugasMas
	HabitatDeAvispas agregarOruga.
	HabitatDeAvispas agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SMB 4/23/2022 16:53:21'!
queElHabitatTengaDosPolillasMas
	HabitatDeAvispas agregarPolilla.
	HabitatDeAvispas agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 14:09:25'!
queElHabitatTengaUnaOrugaMas
	HabitatDeAvispas agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:19:39'!
queElHabitatTengaUnaPolillaMas
	HabitatDeAvispas agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/24/2022 21:08:09'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatDeAvispas eliminarTodosLosHuevosDeAvispas.
	HabitatDeAvispas eliminarTodasLasOrugas.
	HabitatDeAvispas eliminarTodasLasPolillas.
	! !

HabitatDeAvispas initializeAfterFileIn!
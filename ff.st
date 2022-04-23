!classDefinition: #AvispaOriana category: 'ff'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ff'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'ff'!
AvispaOriana class
	instanceVariableNames: ''!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 15:55:56'!
buscarOruga
	^HabitatDeAvispas hayUnaOruga.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:16:43'!
intentarReproducirse
	self buscarOruga ifTrue: [ HabitatDeAvispas incubarHuevoDeAvispa ].! !


!classDefinition: #AvispaOrnella category: 'ff'!
AvispaOriana subclass: #AvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ff'!


!classDefinition: #AvispaPolly category: 'ff'!
DenotativeObject subclass: #AvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ff'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaPolly class' category: 'ff'!
AvispaPolly class
	instanceVariableNames: ''!

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:13:54'!
buscarPolilla
	^HabitatDeAvispas hayUnaPolilla.! !

!AvispaPolly class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:16:39'!
intentarReproducirse
	self buscarPolilla ifTrue: [ HabitatDeAvispas incubarHuevoDeAvispa ].! !


!classDefinition: #HabitatDeAvispas category: 'ff'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ff'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'ff'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeAvispas cantidadDeOrugas cantidadDePolillas'!

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 15:33:46'!
agregarOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.
	! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:18:55'!
agregarPolilla
	cantidadDePolillas := cantidadDePolillas + 1! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/21/2022 19:54:06'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispas.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 14:17:34'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:20:20'!
cantidadDePolillas
	^cantidadDePolillas.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 14:04:00'!
eliminarHuevosDeAvispas
	^cantidadDeHuevosDeAvispas := 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 15:39:50'!
eliminarOrugas
	cantidadDeOrugas := 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:17:40'!
eliminarPolillas
	cantidadDePolillas := 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:00:32'!
hayUnaOruga
	^cantidadDeOrugas > 0! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 16:15:49'!
hayUnaPolilla
	^cantidadDePolillas  > 0.! !

!HabitatDeAvispas class methodsFor: 'as yet unclassified' stamp: 'gmcb 4/23/2022 14:11:08'!
incubarHuevoDeAvispa
	cantidadDeOrugas := cantidadDeOrugas - 1.
	cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas + 1.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'gmcb 4/23/2022 16:28:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispas := 1.
	cantidadDeOrugas := -1.
	cantidadDePolillas := 1.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'ff'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ff'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'ff'!
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


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:57'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:03'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/21/2022 19:48:15'!
habitat
	^ HabitatDeAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:18:37'!
hacerQueElHabitatTengaLosRecursosSuficientes
	HabitatDeAvispas agregarOruga.
	HabitatDeAvispas agregarOruga.
	HabitatDeAvispas agregarPolilla.
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:15:33'!
queElHabitatTengaDosPolillasMas
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 14:09:25'!
queElHabitatTengaUnaOrugaMas
	HabitatDeAvispas agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:19:39'!
queElHabitatTengaUnaPolillaMas
	HabitatDeAvispas agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'gmcb 4/23/2022 16:17:17'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatDeAvispas eliminarHuevosDeAvispas.
	HabitatDeAvispas eliminarOrugas.
	HabitatDeAvispas eliminarPolillas.
	! !

HabitatDeAvispas initializeAfterFileIn!
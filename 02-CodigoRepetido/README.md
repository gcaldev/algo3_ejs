# Preguntas
## Abstracción de los tests 01 y 02
En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

La nueva entidad que creamos representa el comportamiento de verificar que una accion se llevo a cabo antes de un determinado tiempo.


## Cómo representar en Smalltalk
¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Podemos representar entes de la realidad en Smalltalk apartir de: Objetos, Mensajes, Clases.
Los mensajes los podemos usar para representar comportamiento, las clases las podemos usar para abstraer ideas o conceptos abstractos, y los objetos los podemos usar para modelar entidades concretas del mundo real, siendo estos objetos instancias de nuestras Clases.


## Teoría de Naur
¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

La relación que encontramos entre lo leido en el paper de Naur y la abstracción que debimos hacer para eliminar el codigo repetido es que el hecho de tener codigo repetido es un indicio de que hay un aspecto de la realidad relevante (ya que hay un proceso que se esta repitiendo en multiples metodos) que no se tuvo en consideracion. Al modularizar dicho codigo estamos generando una abstraccion que denota un nuevo comportamiento. Esto además facilita la futura modificacion en caso de que surga una nueva modificacion en el mundo real, adecuando la abstraccion de los tests a dicha alteración.

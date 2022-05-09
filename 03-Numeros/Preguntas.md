## Preguntas teóricas
# Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En el primer llamado lo que hacemos con el parametro recibido es enviarle el mensaje polimorfico.
Nuestro primer llamado nos aporta saber con que tipo de clase va a estar interactuando nuestro parametro.
Una vez que se ejecuta dicho llamado, se procede al segundo llamado en el cual a nuestro parametro incial le pasamos un mensaje, que este gracias al polimorfismo sabria responder, en el cual ya sabiendo de que tipo es nuestra clase del primer mensaje sabe el metodo a ejecutar. 

# Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La logica del instanciado consideramos que es mejor tenerla en la subclase correspondiente al objeto a instanciar. 
Ya que de esta manera podemos asegurarnos de no estar rompiendo encapsulamiento y de que su comportamiento sea el adecuado.

# Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Depende de quien frecuentemente recurrira a dichos mensajes podemos clasificarlos en distintas categorias.
Por ej, si tenemos mensajes en nuestra clase que seran utilizados unicamente para testear, se podrian categorizar como mensajes de "testing". 
Tambien podemos agrupar nuestros mensajes si estos representan en conjunto un comportamiento en especifico. Y en casos donde tenemos mensajes que unicamente se utilizaran dentro de la misma clase podemos clasificarlos como mensajes "privados" asi indicando que no se deberia acceder a ellos de forma externa.

# Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

En la superclase declaramos el metodo del mensaje como "self subclassResponsability" ya que este mensaje pasa a ser un mensaje abstracto.
Es decir, es un mensaje que representa un idea de un compartimiento pero que se materializa finalmente en cada uno de las subclases.
En caso de que se quiera implementar una nueva subclase que responda dicho mensaje, en caso de que no se haya implementado nos daria un error avisandonos que falta implementar dicho metodo.

# No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Si rompemos el encapsulamiento estamos accediendo a la estructura interna de un modelo, y en caso de que esta en un futuro cambie nuestro codigo podria fallar, dejar de funcionar correctamente o tener un comportamiento no esperado.
Por otra parte tambien estaria mal romper el encapsulamiento ya que nuestro modelo por su parte tambien estructura nuestro conocimiento sobre el dominio del problema o los entes representados de la realidad, y romper el encapsulamiento provocaria un desorden o una desestructuracion de nuestro conocimiento.

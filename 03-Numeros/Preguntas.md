# Preguntas teóricas
## Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En el primer llamado lo que hacemos con el parametro recibido es enviarle el mensaje polimorfico.
Nuestro primer llamado nos aporta saber con que tipo de clase va a estar interactuando nuestro parametro.
Una vez que se ejecuta dicho llamado, se envia un mensaje al parametro recibido. Posteriormente pueden suceder dos situaciones, la primera es que el objeto recibido no sepa responder el mensaje, mientras que en la segunda si lo podra hacer. En el caso en que lo entienda, dicho objeto tendra la informacion de quien es el parametro recibido, es decir ya conocera de antemano quien es el emisor del mensaje.

## Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La logica del instanciado consideramos que es mejor tenerla en la subclase correspondiente al objeto a instanciar, nos parece mejor evitar realizar el instanciado desde una clase abstracta, ya que no solo nos resulta menos intuitivo y simple sino que ademas es muy probable que las distintas subclases tengan la necesidad de ser instanciadas de distinta manera. Al hacerlo en la subclase si quisieramos tener diferentes maneras de instanciar simplemente deberiamos implementar distintos mensajes donde reciba los parametros correspondientes, haciendo que agregar nuevas formas de instanciado sea muy simple. Por ultimo, al implementar los mensajes de inicializacion fuera de la clase estariamos rompiendo el encapsulamiento ya que estariamos accediendo a variables de instancia.

## Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Para categorizar los metodos consideramos multiples factores. En primer lugar, solemos agrupar metodos dependiendo de que objeto suele emitir ese mensaje, por ejemplo, si un conjunto de metodos es llamado unicamente por un objetos de testing entonces podriamos categorizarlos dentro de una categoria de testing. Otro factor que consideramos es que si un conjunto de metodos suele representar una funcionalidad o comportamiento determinado de nuestro dominio del problema agruparemos estos en una misma categoria.
Por ultimo, un factor al que le damos mucha importancia es si los mensajes estan destinados a ser emitidos por un objeto que no es nuestro modelo (categorizando los metodos en una categoria publica), mientras que en caso de que los mensajes sean enviados unicamente por el mismo objeto y formen parte de la implementacion interna del modelo se categorizaran como privados.


## Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

En la superclase declaramos el metodo del mensaje como "self subclassResponsability" ya que este mensaje pasa a ser un mensaje abstracto. Es decir, es un mensaje que representa un idea de un compartimiento pero que se materializa finalmente en cada uno de las subclases.
Por otro lado, si quisieramos crear una nueva subclase, en caso de que no se haya realizado la implementacion del metodo delegada por la superclase nos daria un error avisandonos que falta implementar dicho metodo.

## No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Si rompemos el encapsulamiento estamos accediendo a la estructura interna de un modelo, y en caso de que esta en un futuro cambie nuestro codigo podria fallar o tener un comportamiento no esperado.
Por otra parte, tambien estaria mal romper el encapsulamiento ya que nuestro modelo por su parte tambien estructura nuestro conocimiento sobre el dominio del problema o los entes representados de la realidad, y romper el encapsulamiento provocaria un desorden o una desestructuracion de nuestro conocimiento.

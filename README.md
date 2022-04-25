# algo3_ejs

Respuestas Ejercicio 1: Avispas y Abejas

## Sobre implementar funcionalidad
Cuando hicimos nuestra implementacion, no pasaba los tres primeros test de una. Fuimos implementando esta funcionalidad haciendo que esta vaya satisfaciendo cada prueba y verificando que las anteriores continuen sin problemas. Este metodo para implementar una funcionalidad nos parecio muy util a la hora de simplificar el cómo llevar a cabo la implementacion para que unicamente cumpla con las pruebas vistas hasta el momento, las cuales nos indicaron cual seria el comportamiento que nuestro modelo debia tener y posteriormente ir extendiendo la funcionalidad de dicho modelo.

## Sobre codigo repetido
Respecto al codigo repetido notamos que tanto la Avispa Oriana como la Avispa Ornella compartian el mismo comportamiento por lo tanto optamos por modelar a la Avispa Oriana como objeto padre de la Avispa Ornella. De esta manera logramos evitar tener que reescribir y tener codigo repetido en todos sus mensajes.
Por otra parte al modelar a la Avispa Polly, notamos que compartian similitudes respecto a su comportamiento pero para poder modelarla como hijo de la Avispa Oriana tendriamos que haber modificado los mensajes de 'hayOruga' y 'hayPolilla' por 'hayAlimento' y de esta manera por una lado estariamos generalizando, algo que no nos convendria hacer ya que no es requerido en este momento, y por otra parte aumentariamos la complejidad de la implementacion innecesariamente. 

En cuanto a la responsabilidad de ver si hay suficientes polillas u orugas y entonces dejar un huevo, quienes se hacen cargo de dicha responsabilidad en nuestro modelo son las mismas Avispas. Podemos decir que esto nos parecio mejor ya que entendimos mediante fuimos implementando que esto representa de una manera mas fiel los entes de la realidad correpsondientes al dominio de nuestro problema, ya que en la realidad es la Avispa quien se encarga de conseguir o de buscar el alimento para sus huevos.

Otra forma que pensamos en un principio pero descartamos fue la de delegar esta responsabilidad al habitat y no a las avispas. 
Si bien nos parece mas simple, ya que reduciriamos la interaccion entre las avispas y el habitat y de esta manera tendriamos un menor acomplamiento, el hecho de que se encargue mayormente el habitat la descartamos ya que entendemos que no seria una representacion tan fiel a la realidad

## Sobre codigo repetido 2
En nuestro modelo planteamos a nuestra AvispaOriana como objeto padre de nuestra AvispaOrnella gracias a lo que vimos en la clase del Jueves pasado. De esta manera logramos evitar mucho codigo que se hubiese repetido en nuestra implementacion.

Respecto al guardado de los huevos decidimos hacerlo mediante un diccionario en el cual guardamos la cantidad de huevos indexandolo por la genetica de los mismos. En nuestro caso usamos para indexar objetos String para simplificar el hecho de que hay dos avispas que comparten la misma genetica, caso contrario si hubiesemos indexado por objeto "Avispa..." hubiesemos requerido de mas logica dentro de nuestros metodos y esto hubiese aumentado la complejidad del modelo innecesariamente.
Teniendo en cuenta como decidimos diseñar los distintos aspectos del modelo consideramos que la opcion que elegimos en nuestro caso es la que mejor se acoplaba y a la vez era la mas sencilla de implementar.

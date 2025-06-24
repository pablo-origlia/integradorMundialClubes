### Programación con Objetos

# Mundial de clubes

***Para hacer predicciones sobre los resultados de los partidos del mundial de clubes se utiliza un mecanismo de simulación en principio a partir de los datos previos de cada equipo, pero a medida que se desarrolla el campeonato se va recalculando en función de los acontecimientos que ocurren.***

Más allá de los diferentes recursos y estrategias con lo que cada equipo encara un partido, la predicción para cualquier partido es que gana el equipo que tenga más de un 20% de potencial que el otro equipo. En caso que no suceda para ninguno de los dos equipos, el resultado esperado es empate. 

El potencial de un equipo se calcula de diferentes formas:

* Para los equipos europeos es la valoración del plantel multiplicado por la cantidad de champions conseguidas.  
* Para los equipos de la Conmebol, equivale a la valoración del plantel multiplicado por el nivel de motivación del equipo. La popularidad es un valor numérico que ya se conoce para cualquier equipo de la conmebol. Esta motivación depende, entre otras cosas, del estilo de su hinchada:   
  - En un equipo con hinchada entusiasta, equivale al cuadrado de la popularidad del equipo.   
  - En un equipo con hinchada "pecho frío", es la décima parte de su popularidad, pero  nunca puede ser menor a 1\.   
  - En un equipo con hinchada mercenaria, es el 1% de la valoración de su plantel.  
* Para los equipos de Estados unidos, por ser locales, su potencial se calcula como la valoración del plantel multiplicado por los millones de habitantes de su ciudad.  
* Para los equipos del resto del mundo el potencial es directamente la valoración de su plantel. 

En todos los casos, la valoración del equipo es la suma de lo que cotiza cada jugador, pero sólo de los que cotizan más de 1 millón. La cotizacion del jugador se calcula como un monto que se conoce previamente por la cantidad de letras de su nombre.

  *Ejemplos:*

  *Para el ejemplo, la cotización de los jugadores ya está calculada.*

  *Boca: Sus jugadores son: Zenón ($10), Merentiel ($7) y Romero ($3) y su popularidad es 5\. Asumiendo que su hinchada es entusiasta, el potencial llega a 20 \* (5\*5) \= 500\. (Si en cambio su hinchada fuera pecho frio, la motivación sería 5/10 \= 0.5 , pero se lo redondea a 1, por lo que su potencial sería igual a la valoración, o sea 20\)*

  *Inter Miami: El plantel esta formado por Messi ($50) Ustari ($2) y varios más que no llegan al millón. La población de Miami es de 0.5 millones de habitantes, por lo que su valoración es de 52 \* 0.5 \= 26\. (Si hubiera otro equipo tambien de Miami, pero con un plantel valuado en $100, haría que su potencial fuera 50\)*

  *Real madrid: Su plantel esta formado por una serie de jugadores que hace que su valoración sea de $1360. Considerando las 15 champions ganadas en su historia, su potencial es 1360 \* 15 \= 20400*

  *Con estos potenciales de ejemplo, el Real Madrid le gana claramente a todos y Boca le gana al Inter Miami. Pero si pasara algo que la hinchada de Boca se volviera pecho frío, allí ganaría el Inter Miami. Con alguna incorporación o baja en los planteles de los equipos, podŕian empatar. ¿Es posible que algún equipo de la conmebol, sin aumentar la cotizacioń de su plantel, le gane al Real Madrid? Si, aumentando su popularidad y con una hinchada entusiasta que lo motive.*

### 1. Grupos  
   Se quiere realizar, para un grupo de la copa, (en este caso 4 equipos, pero podrian ser mas eventualmente)   
   1. Crear un partido entre dos equipos y agregarlo al grupo.  
   2. Averiguar la cantidad de puntos que haría un equipo al jugarse todos los partidos que le corresponden. (3 puntos si gana, 1 si empata, 0 si pierde)  

### 2. Imprevistos 
Se tienen presentes algunas cosas que pueden pasar 
  1. La guerra comercial de impuestos con china, hace que a todos los equipos de un grupo se les vaya el jugador con mayor cotización.   
  2. Cualquier equipo de la conmebol, como consecuencia del levantamiento de las leyes migratorias, aumenta su popularidad una determinada cantidad y la afluencia de público hace que cambie el estilo de su hinchada, de la siguiente manera:  
    * si era mercenaria, pasa a pecho frio  
    * si era pecho frio, pasa a entusiasta  
    * si ya era entusiasta, sigue siéndolo.  
 
### 3. Más jugadores. 
Aparecen nuevos jugadores, de quienes además se conoce el importe por premios recibidos, lo que se suma a lo anterior para calcular su cotización. Estos jugadores pueden estar en cualquier equipo.  

### 4. Creatividad. 
Agregar un nuevo estilo de hinchada, y que todo siga funcionando con el mínimo impacto posible  

### 5. Pruebas. 
Hacer un par de test para probar las principales funcionalidades



# Final 2c 2020 - 15/03/2021 - Algoritmos 3 - FIUBA:

## Enunciado
Luego del éxito de los FiubaCOINs, la Fintech decidió implementar una nueva funcionalidad, ofreciendo la posibilidad a los usuarios de invertir sus criptomonedas. Para esto, nos pidieron implementar los siguientes nuevos servicios:

**`invest: anAmountOfFiubaCoins from: aWalletId`** → Invierte una cantidad de FiubaCOINs de la billetera. Al invertir, se realiza una transferencia por el monto invertido hacia una billetera interna de la Fintech. A diferencia de una transferencia convencional, esta transferencia no tiene comisión ni demora en impactar. La inversión debe ser por un monto positivo, y no es posible invertir más dinero si ya me encuentro invirtiendo.

**`stopInvestmentOn: aWalletId`** → Frena la inversión en curso de la billetera en cuestión (notar que no es posible frenar la inversión si no hay una en curso). Al frenar la inversión, el dinero invertido es transferido nuevamente a la billetera (sin comisión ni demora en impactar), sumando un monto adicional ganado por la inversión (llamado retorno o “return” en inglés), según los siguientes criterios:

Si se frena la inversión ANTES de una semana y la wallet NO es promocional, NO tiene retorno.

Si se frena la inversión ANTES de una semana pero la wallet ES promocional, tiene 1% de retorno sobre el valor total invertido.

Si se frena la inversión LUEGO de una semana (o más) y la wallet NO es promocional, tiene 1% de retorno sobre el valor total invertido.

Si se frena la inversión LUEGO de una semana (o más) y el wallet ES promocional, tiene 2% de retorno sobre el valor total invertido.

Resolver el ejercicio mediante TDD, aplicando todas las heurísticas de diseño vistas en la materia. Separar los tests bajo una nueva suite (InvestmentsTest) en lugar de extender FintechTest.

**Ayuda**

Por cuestiones de tiempo, recomendamos no contemplar otras restricciones de funcionalidad más allá de las explícitamente mencionadas en el enunciado.

Los servicios createPromotionalWallet y createWallet de la Fintech (provistos en el código inicial) son aquellos que les permiten crear billeteras promocionales y no promocionales respectivamente.

Pueden asumir que la billetera interna de la Fintech siempre va a tener dinero suficiente para devolver los intereses obtenidos por todas las inversiones. Es decir, pueden crearla con un saldo arbitrario de 1000 FiubaCOINs y no preocuparse por que pasa si se agota. Explorar estos casos donde esta billetera se queda sin fondos sólo sumará puntos extras, tipo bonus track.

Planilla para consultas
https://docs.google.com/spreadsheets/d/1g3Wl8PHH_pYmOFez-gkuRD_c7d1PFzCubYNepovPiQk/edit?usp=sharing
Sobre la corrección

## Los criterios de corrección priorizarán:

Que hayan llegado a la solución mediante TDD.

Que el modelo resultante utilice polimorfismo en lugar de IFs (cuando corresponda), que no tenga código repetido y que las jerarquías creadas sigan los criterios vistos en la materia, que no se rompa encapsulamiento y que la asignación de responsabilidades entre los objetos sea la correcta.

Que el modelo cumpla con el resto de las heurísticas de diseño vistas durante la cursada.

Quitar código repetido de los tests y clasificar correctamente los métodos tiene baja prioridad. Recomendamos hacerlo una vez que hayan cumplido con la consigna.

En caso de quedarse cortos de tiempo, es preferible una solución incompleta a nivel funcional pero con un buen modelo y código claro, que una solución completa que no sigue las heurísticas vistas en la materia.

Es importante que los tests de la entrega pasen. En caso que haberse quedado en medio de un refactor, recomendamos es entregar una versión previa, con los tests pasando, sin el refactor (graben frecuentemente la imagen / hagan file-out para facilitar esto)

## Entrega del examen

Tienen tiempo para entregarlo hasta las 22:30hs. No serán tomadas en cuenta las entregas posteriores a ese horario (estricto).

Entregar el fileout de la categoría de clase correspondiente al examen, que debe incluir toda la solución (modelo y tests).

Entregar también el archivo que se llama CuisUniversity-nnnn.user.changes.

Probar que el archivo generado en el paso 1 se cargue correctamente en una imagen “limpia” (o sea, sin la solución que crearon) y que todo funcione correctamente. Esto es fundamental para que no haya problemas de que falten clases/métodos/objetos en la entrega.

Realizar la entrega enviando mail A LA LISTA DE DOCENTES ´fiuba-algoritmos-iii-doc@googlegroups´.com con el Asunto: "Nro Padrón: nnnn - Solución Recuperatorio"

**IMPORTANTE:** Al enviar la solución deben esperar a recibir una confirmación de recepción ANTES de retirarse del aula virtual de Zoom. Recién una vez recibida la confirmación, puede retirarse.

----

Reglas y normas a cumplir para examen remoto
Dentro de su propio breakout room particular cada alumno deberá cumplir con:


Tener compartido su escritorio principal durante la duración completa del examen. Importante destacar que debe ser el escritorio, y no sólo CUIS, pues se deberá poder visualizar el resto de sus aplicaciones abiertas.

Reducir la cantidad de aplicaciones abiertas en su escritorio al mínimo. Una vez recibido el mail con el enunciado del examen, no debería necesitar tener abierta ninguna otra aplicación más allá de la que utilice para visualizarlo y CUIS. En especial, las aplicaciones de comunicación (como chats tipo Whatsapp) no están permitidas.

Deberá mantener el vídeo de su cámara siempre prendido y el audio de su micrófono siempre abierto. En el caso de que considere que esto viola su privacidad, podrá prender cámara y micrófono sólo en el momento que un docente que ingresa a su breakout room particular quiera validar su identidad.

Si se produce una desconexión, intentar reconectarse de forma inmediata. De volverse imposible el inicio de sesión en Zoom, comunicarse con la lista de docentes ´fiuba-algoritmos-iii-doc@googlegroups´.com.


No cumplir con alguna de estas normas será motivo suficiente para que como mínimo pierda el beneficio de la promoción (o directamente desaprobar el examen, en caso de tratarse de un final). Por favor, sean responsables con el uso de estas reglas y no se

comprometan ustedes, ni a los docentes.


**IMPORTANTE:** Los docentes entrarán y saldrán de su breakout room particular potencialmente varias veces durante la duración del parcial con su audio muteado. Si el mismo no entabla una conversación, no se distraiga y siga trabajando normalmente.

# La base de datos no se borra sin preguntar

> borrar, restaurar o pisar datos existentes se pregunta antes y se espera la respuesta; copias que se verifican, no que se suponen

(de claude-base) Regla dura de Raúl desde ODA (17-ago-2026): antes de BORRAR, RESTAURAR o PISAR cualquier dato hay que preguntarlo muy claramente y esperar la respuesta.

**Why:** en ODA un script de semilla que sobrescribía borró ediciones hechas a mano desde el panel y no había copia: fue irrecuperable. El daño vino de scripts sueltos, no de la suite de pruebas.

**How to apply:**
- Cubre: `delete`, `truncate`, restaurar una copia, cualquier upsert que pise filas existentes, vaciar un almacenamiento y cualquier script que escriba sobre datos que no haya creado esa misma sesión. Leer es libre.
- Si la configuración vive en la base de datos y también en el código (semillas), **la base de datos manda**: editar la semilla es libre, empujarla es lo peligroso. Apuntar en esta nota qué comando de semilla es seguro (solo añade) y cuál destructivo (sobrescribe).
- Copias: tener un comando de copia y otro que **verifique** la copia contra la base viva (filas por tabla, cobertura). Sin verificar, «copia hecha» es fe. La lista de tablas de la copia se comprueba sola contra el esquema; si se mantiene a mano, se queda corta.
- {{Comandos de este proyecto: copia, verificación, restauración (en seco por defecto).}}

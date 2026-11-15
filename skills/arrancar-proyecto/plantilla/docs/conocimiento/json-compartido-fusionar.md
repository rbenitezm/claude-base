# JSON compartido: fusionar, nunca reconstruir

> toda columna o fichero JSON que escriben varias partes se actualiza con `{ ...previo, … }` leído justo antes

(de claude-base) En ODA (ago-2026) un paso que regeneraba la estructura de un libro reescribía desde cero la columna JSON del plan y borró la maqueta que otra parte ya había guardado en un proyecto real.

**Why:** un `update({ plan: {objeto nuevo} })` sin el previo destruye en silencio el trabajo de otras partes; se descubre días después.

**How to apply:** todo escritor de un JSON compartido lee el valor justo antes y escribe `{ ...previo, campo: nuevo }`. Si varias partes lo tocan a la vez, una función única de fusión con pruebas, y escritura condicional para no pisar una escritura concurrente.

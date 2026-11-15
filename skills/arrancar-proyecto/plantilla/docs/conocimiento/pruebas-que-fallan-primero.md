# Pruebas que fallan primero

> el método de Raúl para auditorías y arreglos: analizar, planificar, prueba que falla, arreglo, la prueba pasa a la suite normal; la migración antes que el código

(de claude-base) Así se cerraron las dos auditorías de seguridad de ODA (27-30 sep-2026).

**Why:** una prueba que falla antes del arreglo demuestra que el fallo existía y que el arreglo lo cubre; sin ella, «arreglado» es una opinión.

**How to apply:**
1. Analizar y planificar antes de programar; con un informe de auditoría, punto por punto.
2. Escribir la prueba que falla en una carpeta aparte (`__tests__/auditoria/`, activada con una variable) para que no rompa la suite mientras tanto.
3. Arreglar; cuando pasa, la prueba se mueve a la suite normal.
4. Una migración de base de datos se aplica **antes** de subir el código que la usa.
5. Al cerrar, comprobar con git (`git branch -r --contains <commit>`) que todo está subido, en vez de suponerlo.

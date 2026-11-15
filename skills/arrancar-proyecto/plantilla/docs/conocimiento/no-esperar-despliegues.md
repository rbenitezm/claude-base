# No esperar despliegues

> tras el push, avisar y parar; nada de sondear el despliegue ni mirar la web al minuto

(de claude-base) Raúl, 15-sep-2026: «no quiero que gastes tokens en la espera de los despliegues».

**Why:** cada sondeo son llamadas y contexto que no aportan; la plataforma avisa sola y Raúl mira la web cuando quiere.

**How to apply:** push, un mensaje de una línea con lo subido, y parar. Si Raúl pregunta más tarde si está desplegado, entonces se comprueba una vez.

# Un despliegue mata los botones abiertos

> cada despliegue invalida las server actions de las pestañas abiertas: no desplegar mientras alguien edita

(de claude-base) En ODA (16-ago-2026) una persona perdió todas sus ediciones de un cómic mientras se desplegaba diez veces seguidas: los botones Guardar morían en silencio y la pantalla seguía pintando el borrador local, así que parecía guardado.

**Why:** las server actions van ligadas al build que cargó la página; tras un despliegue, la pestaña vieja llama a acciones que ya no existen.

**How to apply:** subir a la rama de producción solo según la regla del `CLAUDE.md`; si alguien está editando en la web, esperar aunque haya permiso. Mitigación de fondo: el guardado se confirma contra la base de datos y, si falla, se avisa en pantalla.

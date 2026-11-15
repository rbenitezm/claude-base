# «Redeploy» repite el código de ese despliegue

> en Vercel, «Redeploy» de una fila vieja vuelve a montar su commit viejo; tras cambiar variables, redesplegar la del último commit o subir uno

(de claude-base) En ODA (30-oct-2026) se cambió una variable y se pulsó «Redeploy» en el despliegue de Production, que era a su vez un redeploy de un commit anterior: producción siguió con código viejo.

**Why:** las filas «Redeploy of …» no enseñan el commit, solo el título.

**How to apply:** tras cambiar variables, «Redeploy» de la fila con el último commit de la rama principal (se ve el hash), o subir un commit. Comprobar que la etiqueta de Production queda en esa fila.

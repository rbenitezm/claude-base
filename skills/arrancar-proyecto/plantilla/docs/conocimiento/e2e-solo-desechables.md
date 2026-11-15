# E2E solo con desechables

> si las pruebas tocan datos reales: usuarios de un dominio de prueba, limpieza solo de lo que poseen, nunca de lo compartido

(de claude-base) En ODA los E2E corren contra la base de datos de producción. El 22-jul-2026 se vio que la limpieza borraba los espacios donde el usuario de prueba era *miembro*, no solo dueño: una prueba que lo invitara a algo real lo habría borrado al limpiar.

**Why:** la limpieza es la parte más peligrosa de una prueba contra datos reales.

**How to apply:**
1. Usuarios de prueba solo con un dominio reservado (`@example.com`); crear y limpiar lo rechazan si no.
2. La limpieza borra solo lo que el desechable **posee**, y nunca algo que tenga algún miembro real.
3. Lo creado en una prueba se captura por id al crearlo y se limpia solo ese id.
4. Los flujos que cuestan dinero real (APIs de pago) no se automatizan: lista de comprobación manual.
5. Lo compartido «de la casa» se comprueba en solo lectura.

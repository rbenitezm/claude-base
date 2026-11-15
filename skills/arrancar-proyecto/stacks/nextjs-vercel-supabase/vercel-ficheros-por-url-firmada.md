# Ficheros grandes por URL firmada, nunca por Vercel

> devolver PDF o vídeo en el cuerpo de una ruta agota la transferencia de Vercel; se guardan en Supabase Storage y se entrega una URL firmada

(de claude-base) En ODA (14-sep-2026) Vercel avisó de que se había consumido el 100 % de Fast Origin Transfer del plan Hobby: las rutas devolvían PDF de 11-40 MB en el cuerpo.

**How to apply:** cualquier fichero grande que salga de la app (PDF, DOCX, audio, vídeo) se guarda en un cubo privado y la ruta devuelve una URL firmada de corta duración (JSON para botones con progreso, 302 para enlaces). Si Vercel vuelve a avisar, mirar Usage y buscar qué ruta devuelve bytes.

# Supabase: lo que engorda es el almacenamiento

> el plan gratis se agota por ficheros y vídeo, no por la base de datos; recomprimir antes de guardar y medir antes de culpar

(de claude-base) En ODA (19-ago-2026) Supabase cortó la API de datos y el almacenamiento por pasar del plan gratis: 3,4 GB de storage y 27 GB de salida; la base de datos entera eran 3 MB. El peso eran clips de vídeo guardados en crudo (~20 MB cada uno). Pro cuesta 25 $/mes (100 GB storage, 250 GB salida) y restaura el servicio al instante.

**How to apply:** todo vídeo se recomprime antes de guardarse (p. ej. CRF 23). Antes de culpar a la base de datos por espacio, medir el almacenamiento. Las cachés regenerables van en carpetas propias para poder vaciarlas.

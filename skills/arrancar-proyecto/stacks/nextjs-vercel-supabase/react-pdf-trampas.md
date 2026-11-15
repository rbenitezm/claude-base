# react-pdf: trampas que fallan en silencio

> ocho trampas verificadas de @react-pdf/renderer 4.5 (páginas de alto 0, bucles, imágenes que desaparecen, fuentes sin incrustar)

(de claude-base) Verificadas con sondas en ODA con @react-pdf/renderer 4.5.1:

1. `wrap={false}` + tamaño en array → página de alto 0.
2. Coordenadas negativas → parte la página.
3. Bytes JPEG con mime PNG (o al revés) → la imagen falla en silencio. Detectar por firma (`0x89 0x50` = PNG).
4. Imagen a exactamente el alto de página → bucle infinito / sin memoria. Rebajar 0,5 pt.
5. Marcas de corte sueltas en una página con padding → mismo bucle. Envolver en un contenedor `fixed` de `height: pageH - 0.5`.
6. Un `<Page>` dentro de `React.Fragment` pierde sus imágenes `fixed`. Usar arrays planos con key (`flatMap`).
7. `objectFit: 'contain'` en una `<Image>` en posición absoluta se ignora y la imagen se estira. Calcular el encaje a mano con las dimensiones reales; `'cover'` sí funciona.
8. Un `<Text>` sin `fontFamily` usa la Helvetica base, que no va incrustada: imprentas como KDP rechazan el PDF. Todo `<Text>` lleva `fontFamily`.

**Verificar un PDF de imprenta midiendo, no mirando:** la matriz de colocación del stream (`a b c d e f cm /X Do`) da el tamaño exacto al que se dibuja una imagen. El encaje de imágenes, en un solo módulo con pruebas; copiado en dos sitios acaba distinto.

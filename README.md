# Boda Micaela & Felipe · 18.12.2027

Invitación web de la boda, publicada con GitHub Pages:
**https://mathiasbalcazar.github.io/Boda-Mica-y-Feli-/**

## Enlaces personalizados

- `?para=Nombre` muestra el nombre del invitado en el sobre y en el saludo.
- `?lang=es`, `?lang=de` o `?lang=en` abre la invitación en ese idioma.

Ejemplo: `https://mathiasbalcazar.github.io/Boda-Mica-y-Feli-/?para=Oma%20Helga&lang=de`

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `index.html` | Toda la invitación: diseño, textos en ES/DE/EN y formulario de confirmación |
| `img/` | Fotos optimizadas para web (las originales no están aquí) |
| `extras/rsvp-google-sheets.gs` | Código de Apps Script de la hoja de Google "Confirmaciones Boda Mica y Feli" |
| `extras/servidor.ps1` | Servidor local para ver la página en la computadora antes de publicarla |

## Datos de configuración (en `index.html`)

- `BODA`: fecha y hora de la boda (la hora es provisional).
- `RSVP_URL`: dirección del Apps Script que guarda las confirmaciones en Google Sheets.
- `TEXTOS`: todos los textos en los tres idiomas.

## Pendiente

- Lugar, dirección y hora de la ceremonia y la celebración (y los enlaces "Cómo llegar")
- Horario del itinerario
- Código de vestimenta
- Datos de regalos
- Fecha límite para confirmar
- Video de portada


## Versión meme 💣

Proyecto aparte dentro del mismo repositorio, con la misma invitación y el mismo formulario de confirmación, pero con otra entrada.

| Página | Enlace | Qué tiene |
|---|---|---|
| `meme/` | https://mathiasbalcazar.github.io/Boda-Mica-y-Feli-/meme/ | Invitación que abre con una bomba, cuenta regresiva de 5 segundos, explosión y la escena de las trompetas de Shrek. Incluye el tráiler. También acepta `?para=` y `?lang=`. |
| `video/` | https://mathiasbalcazar.github.io/Boda-Mica-y-Feli-/video/ | El tráiler en video vertical (1080×1920, 39 s), con botón para descargarlo. |

Archivos de la versión meme:

- `meme/index.html`: la invitación con la bomba
- `meme/media/`: la escena de Shrek, su imagen de portada y el sonido de la explosión
- `video/invitacion-meme.mp4`: el tráiler (mezcla de dos plantillas de TikTok con fotos de los novios)
- `video/poster.jpg`: la imagen que se ve antes de darle play

## Paleta y tipografía

Marfil perla `#F3EFE6` · Arena suave `#D8C8B3` · Azul agua `#A9C3D0` · Verde salvia `#9DA891`

Cormorant Garamond (títulos) · Great Vibes (caligrafía) · Montserrat (detalles)

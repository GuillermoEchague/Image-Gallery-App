# Prueba Intermedia – Interfaces con SwiftUI

## Requisitos del Proyecto

### 1. Pantalla Principal
- Muestra una bienvenida a la aplicación con un título y una imagen llamativa.
- Posee un campo que pide al usuario ingresar su nombre o alias.
- Debe tener un botón que al seleccionarlo se llevará consigo el dato ingresado hasta la siguiente vista.

### 2. Pantalla Secundaria
- Muestra una lista de elementos (pueden ser celdas) que poseen una imagen e información básica (Mínimo 20 elementos).
- El título de la vista tiene que coincidir con el nombre o alias ingresado en la vista anterior.
- Incluye en la barra de navegación un botón para volver y otro para “más información”.
- Al darle clic al botón de información se debe abrir un modal al 50% (Con posibilidad de extenderse) que posea datos respecto al tema elegido para la aplicación, además de cinco o más características como:
  - Nombre de la aplicación
  - Desarrollador
  - Versión
  - Y otras características relevantes.

### 3. Detalles importantes
- Utiliza `AppStorage` para guardar la pantalla en la que se cierra la aplicación. Ten en cuenta que, si se cierra en la segunda pantalla también se debe guardar el dato del nombre/alias.
- La aplicación solo debe tener versión **Portrait** (vertical), es decir, que si volteamos el móvil el diseño no debe verse afectado.
- Los colores son completamente a elección, pero es necesario crear mínimo 2 `ColorSet`.
- No olvides agregar un icono en los `Assets` para que destaque a la hora de compilar la aplicación.
- La pantalla principal debe tener un mínimo de dos animaciones. Los elementos afectados y el estilo de estas queda a libre elección.
- No olvides organizar el proyecto en carpetas.
- El estilo de las imágenes queda a libre elección, pero es ideal que el grueso de la aplicación trate de un solo tema.
- La experiencia de usuario debe ser fluida e intuitiva.

---

## Capturas de Pantalla

### Pantalla de Inicio
<img src="https://raw.githubusercontent.com/GuillermoEchague/image/refs/heads/main/img_intermedio/1.png" width="40%" alt="Login">
<img src="https://raw.githubusercontent.com/GuillermoEchague/image/refs/heads/main/img_intermedio/2.png" width="40%" alt="Login Name">

### Pantalla de Lista
<img src="https://raw.githubusercontent.com/GuillermoEchague/image/refs/heads/main/img_intermedio/3.png" width="40%" alt="List Screen">

### Pantalla de Detalles
<img src="https://raw.githubusercontent.com/GuillermoEchague/image/refs/heads/main/img_intermedio/4.png" width="40%" alt="Detail Screen 1">
<img src="https://raw.githubusercontent.com/GuillermoEchague/image/refs/heads/main/img_intermedio/5.png" width="40%" alt="Detail Screen 2">

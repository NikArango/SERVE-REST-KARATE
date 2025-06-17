# Guía de Uso del Framework Karate

Este proyecto utiliza el framework Karate para pruebas de API. El proyecto está estructurado en Java, JavaScript y Maven.

> [!IMPORTANT]
> Repositorio del Framework de Pruebas Automatizadas BE - Karate :link: [link](https://github.com/pacifico-seguros-org/frameworkpruebasautomatizadas-be)


> [!NOTE]
> :movie_camera: Capacitación Framework Automatización BE - Karate :link: [link](https://pacificocia.sharepoint.com/:v:/r/sites/teamqa/Shared%20Documents/General/Gesti%C3%B3n%20de%20Conocimientos/Automatizaci%C3%B3n/Automatizaci%C3%B3n%20BE/Framework%20Karate/Introducci%C3%B3n%20Framework%20BE%20(Karate).mp4?csf=1&web=1&e=W9qIc4)

> [!TIP]
> Usa Copilot [aqui](https://github.com/Wiki-Pacifico/DevSecOps-PGA/wiki/GENAI-%E2%80%90-Copilot-QA-Backend) el manual.

## Estructura del Proyecto

La estructura del proyecto es la siguiente:
```txt
frameworkpruebasautomatizadas-be/

├── src/
│   └── test/
│       ├── java/
│       │   ├── karate/
│       │   │   ├── models/
│       │   │   │   └── Producto.java
│       │   │   │   └── Usuario.java
│       │   │   ├── runner/
│       │   │   │   └── TestRunner.java
│       │   │   ├── util/
│       │   │   │   └── Cucumber.java
│       │   ├── resources/
│       │   │   ├── features/
│       │   │   │   ├── carritos/
│       │   │   │   │   └── registrarCarrito.feature
│       │   │   │   ├── productos/
│       │   │   │   │   └── listarProductos.feature
│       │   │   │   │   └── registrarProducto.feature
│       │   │   │   ├── usuarios/
│       │   │   │   │   └── editarUsuario.feature
│       │   │   │   │   └── eliminarUsuario.feature
│       │   │   │   │   └── listarUsuarios.feature
│       │   │   │   │   └── loginUsuario.feature
│       │   │   │   │   └── obtenerUsuario.feature
│       │   │   │   │   └── registrarUsuario.feature
│       │   │   ├── request/
│       │   │   │   ├── carritos/
│       │   │   │   │   └── registrarCarrito.body.json
│       │   │   │   │   └── registrarCarrito.schema.json
│       │   │   │   ├── productos/
│       │   │   │   │   └── listarProductos.body.json
│       │   │   │   │   └── registrarProducto.body.json
│       │   │   │   │   └── registrarProducto.schema.json
│       │   │   │   ├── usuarios/
│       │   │   │   │   └── editarUsuario.body.json
│       │   │   │   │   └── editarUsuario.schema.json
│       │   │   │   │   └── eliminarUsuario.schema.json
│       │   │   │   │   └── listarUsuarios.schema.json
│       │   │   │   │   └── loginUsuario.body.json
│       │   │   │   │   └── loginUsuario.schema.json
│       │   │   │   │   └── obtenerUsuario.schema.json
│       │   │   │   │   └── registrarUsuario.body.json
│       │   │   │   │   └── registrarUsuario.schema.json
│       │   │   ├── response/
│       │   │   │   ├── carritos/
│       │   │   │   │   └── registrarCarrito.response.csv
│       │   │   │   ├── productos/
│       │   │   │   │   └── listarProductos.response.csv
│       │   │   │   │   └── registrarProducto.response.csv
│       │   │   │   ├── usuarios/
│       │   │   │   │   └── loginUsuario.response.csv
│       │   │   │   │   └── obtenerUsuario.response.csv
│       │   │   │   │   └── registrarUsuario.response.csv
│       │   │   └── config.properties
│       │   └── karate-config.js
│       └── logback-test.xml
├── pom.xml
├── .gitignore
└── README.md
```
| Directorio/Archivo   | Descripción                                                                                                                           |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------|
         |
| `karate/models`      | Abstrae logica por entidad de la API que servirá de apoyo para la ejecucion de pruebas.                                               |
| `karate/runner`      | Contiene el archivo TestRunner.java para ejecutar las pruebas con JUnit.                                                              |
| `karate/util`        | Clases utilitarias para soporte en pruebas                                                                                            |
| `resources/features` | Archivos .feature que definen los escenarios de prueba en formato Gherkin.                                                            |
| `resources/request`  | Archivos JSON para datos de entrada o esquemas                                                                                        |
| `resources/response` | Archivos CSV para capturar datos específicos de respuesta de la solicitud                                                             |
| `karate-config`.js   | Configuración de entornos (integración, certificación, producción).                                                                   |
| `pom.xml`            | Archivo de configuración de Maven con dependencias del proyecto.                                                                      |
| `.gitignore`         | Define archivos y carpetas a ignorar por Git.                                                                                         |
| `README.md`          | Documentación del proyecto incluyendo instrucciones de configuración, ejecución y estrategia de automatización y patrones utilizados. |

## Configuración de entornos

En el archivo karate-config.js se encuentran las configuraciones de los entornos de integración, certificación y producción.

  ```javascript
  function fn() {
      var env = karate.env;
      if (!env) {
          env = 'integracion';
      }

      var config = {
          tokenUrl: '',

      };

      if (env == 'integracion') {
          config.tokenUrl = 'https://serverest.dev/',

      }

      if (env == 'certificacion') {
          config.tokenUrl = 'https://serverest.dev/',

      }

      if (env == 'produccion') {
          config.tokenUrl = 'https://serverest.dev/';

      }

      return config;
  }
  ```

## Ejecución de Pruebas

Los escenarios de prueba se definen en los archivos `.feature` en el directorio `src/test/java/resources/features`. Cada escenario está etiquetado con una etiqueta única para su fácil identificación y ejecución.

Por ejemplo, para ejecutar el escenario de prueba etiquetado con `@TokenTest`, use el siguiente comando:

Para Windows/Linux/Mac:

```bash
# Ejecución por Tags
mvn test -Dkarate.options="--tags @TokenTest"

# Ejecución por Tags Windows
mvn test --% -Dkarate.options="--tags @TokenTest"

# Ejecución por entornos
mvn test -Dkarate.options="--tags @TokenTest" -Dkarate.env="certificacion"

  ```

> [!NOTE]
> Para usuarios de Windows que utilicen PowerShell como terminal, se recomienda el uso de `--%`.  
> En caso contrario, se sugiere utilizar el CMD para evitar problemas con el manejo de parámetros.

# Estrategia de Automatización y Patrones Utilizados

## Estrategia de Automatización

 Para la automatización de pruebas de API. La estrategia se basa en:

- **Uso de framework Karate:** El proyecto utiliza el framework Karate que cuenta con sintaxis sencilla basada en gherkin, incorporando también código java/js admitiendo protocolos http y https, siendo de esta manera más robusto para automatizar pruebas de APIs.
- **Uso de maven:** El proyecto utiliza el maven para la configuración de dependencias del proyecto desde repositorios centrales evitando conflictos y facilitando actualizaciones.
- **Desarrollo guiado por escenarios (BDD):** Los casos de prueba se definen en archivos `.feature` usando Gherkin, facilitando la colaboración entre QA y negocio.
- **Ejecución secuencial:** Las pruebas se ejecutan secuencialmente para seguir los flujos que amerita el sistema mediante [`karate.runner.TestRunner`](src/test/java/karate/runner/TestRunner.java).
- **Gestión de entornos:** La configuración de url/endpoints y credenciales se centraliza en [`karate-config.js`](src/test/java/karate-config.js), permitiendo pruebas en integración, certificación y producción.


## Patrones Utilizados

- **API Object Model:** Separando la lógica adicional requerida en los escenarios respecto a cada entidad como en nuestro caso para Usuarios y Productos([`karate/models`](src/test/java/karate/models/)).
- **Modularidad:** Cada endpoint  tiene su propio archivo `.feature` y sus datos asociados como archivos de [`resources/request`](src/test/java/resources/request), [`resources/response`](src/test/java/resources/request) y [`karate/models`](src/test/java/karate/models/), facilitando el mantenimiento y escalabilidad.
- **Reutilización de pasos y datos:** Al usar escenarios(con sus datos asociados) como parte del flujo de otros optimizando tiempos en el proceso de pruebas.




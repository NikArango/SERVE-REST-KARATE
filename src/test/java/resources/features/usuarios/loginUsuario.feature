@loginUsuario
Feature: Registro de usuarios a traves de SERVEREST
  Como un usuario del sistema,
  quiero poder loguearme a través de la API,
  para realizar transacciones en el sistema.

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

    * def body = read('classpath:resources/request/usuarios/loginUsuario.body.json')
    * def schema = read('classpath:resources/request/usuarios/loginUsuario.schema.json')
    * def usuario = Java.type('karate.models.Usuario')


  @status200
  Scenario Outline: Verificar login de usuarios exitoso-${__num}
    * set body.post.email = "<email>"
    * set body.post.password = "<password>"
    Given path '/login'
    And request body.post
    When method post
    Then status 200
    And match response == schema.post["200"]
    * if(__num == 0){usuario.limpiarTokenCsv()}
    * usuario.registrarTokenEnCsv(response.authorization)

    Examples:
      |read('classpath:resources/response/usuarios/obtenerUsuario.csv') |


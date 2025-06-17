@obtenerUsuario
Feature: Obtener informacion de un usuario a través de SERVEREST
    Como un administrador del sistema,
    quiero poder obtener informacion de un usuario mediante su Id a través de la API,
    para administrar la base de datos de usuarios.

    Background:
        * url baseUrl
        * header Content-Type = 'application/json'

        * def schema = read('classpath:resources/request/usuarios/obtenerUsuario.schema.json')
        * def usuario = Java.type('karate.models.Usuario')
    
    @status200
    Scenario Outline:Verificar la obtención de informacion de un usuario mediante su Id - Success-${__num}
        Given path '/usuarios/<id>'
        When method get
        Then status 200
        And match response == schema.get["200"]
        * if(__num == 0){usuario.limpiarInformacionCsv()}
        * usuario.registrarInformacionEnCsv(response.nome,response.email,response.password,response.administrador)
    Examples:
        |read('classpath:resources/response/usuarios/registrarUsuario.csv') |


    @status400
    Scenario Outline: Verificar usuario no encontrado-"<CP>"
        Given path '/usuarios/<Id>'
        When method get
        Then status 400
        And match response == schema.get["400"]
        Examples:
            |CP| Id |
            | 1 | 0000000000000000  |
            | 2 | 0000000000000001  |
            | 3 | 0000000000000002  |

@eliminarUsuario
Feature: Eliminar usuarios a traves de SERVEREST
    Como un administrador del sistema,
    quiero poder eliminar usuarios a través de la API,
    para administrar la base de datos de usuarios.

    Background:
        * url baseUrl
        * def schema = read('classpath:resources/request/usuarios/eliminarUsuario.schema.json')

    
    @status200
    Scenario Outline: Verificar eliminación de usuarios - Success-${__num}
        Given path '/Usuarios/<id>'
        When method delete
        Then status 200
        And match response == schema.delete["200"]
    Examples:
        |read('classpath:resources/response/registrarUsuario.csv') |


    @status400
    Scenario Outline: Verificar que no se pueda eliminar un usuario con carrito registrado-${__num}

        Given path '/Usuarios/<id>'
        When method delete
        Then status 400
        And match response == schema.delete["400"]
        Examples:
            |read('classpath:resources/response/usuarios/registrarUsuario.csv') |





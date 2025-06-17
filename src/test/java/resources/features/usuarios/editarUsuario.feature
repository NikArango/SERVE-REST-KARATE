@editarUsuario
Feature: Editar usuarios a traves de SERVEREST
    Como un administrador del sistema,
    quiero poder editar usuarios a través de la API,
    para administrar la base de datos de usuarios.

    Background:
        * url baseUrl
        * header Content-Type = 'application/json'
        * def body = read('classpath:resources/request/usuarios/editarUsuario.body.json')
        * def schema = read('classpath:resources/request/usuarios/editarUsuario.schema.json')

    @status200
    Scenario Outline: Verificar la edición de un usuario - Success-"<CP>"

        *  body.put.nome = "<nome>"
        *  body.put.email = "<email>"
        *  body.put.password = "<password>"
        *  body.put.administrador = "<administrador>"

        Given path '/Usuarios/<id>'
        And request body.put
        When method put
        Then status 200
        And match response == schema.put["200"]

        Examples:
            |CP                    |id|nome|email|password|administrador|
            | Editar nome          |ZgYvrQf7W5CiZv1a      |Fulano da Silvaceditadoo    |  beltrano1@qa.com.br   |  teste       |  true           |
            | Editar email         |ZgYvrQf7W5CiZv1a       |Fulano da Silvac1    |  beltranoeditadoo@qa.com.br   |  teste       |  true           |
            | Editar password      |ZgYvrQf7W5CiZv1a       |Fulano da Silvac1    |  beltrano1@qa.com.br   |  testeeditadoo       |  true           |
            | Editar administrador |ZgYvrQf7W5CiZv1a        |Fulano da Silvac1    |  beltrano1@qa.com.br   |  teste       |  false           |

    @status400
    Scenario Outline: Verificar que no se pueda editar un usuario con un email que ya se esta usando-"<CP>"
        *  body.put.nome = "<nome>"
        *  body.put.email = "<email>"
        *  body.put.password = "<password>"
        *  body.put.administrador = "<administrador>"
        Given path '/Usuarios/<id>'
        And request body.put
        When method put
        Then status 400
        And match response == schema.put["400"]

        Examples:
            |CP                                             |id|nome|email|password|administrador|
            | Editar nome y colocar email ya usado          | xNdi6TSUOCFZr4Os      |Fulano da Silvaceditado    |  beltrano100282@qa.com.br   |  teste       |  true           |
            | Editar password y colocar email ya usado      |xNdi6TSUOCFZr4Os       |Fulano da Silvac1    |  beltrano100282@qa.com.br   |  testeeditado       |  true           |
            | Editar administrador y colocar email ya usado |xNdi6TSUOCFZr4Os        |Fulano da Silvac1    |  beltrano100282@qa.com.br   |  teste       |  false           |

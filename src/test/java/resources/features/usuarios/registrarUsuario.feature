@registrarUsuario
Feature: Registro de usuarios a traves de SERVEREST
    Como un administrador del sistema,
    quiero poder registrar usuarios a través de la API,
    para administrar la base de datos de usuarios.

    Background:
        * url baseUrl
        * header Content-Type = 'application/json'

        * def body = read('classpath:resources/request/usuarios/registrarUsuario.body.json')
        * def schema = read('classpath:resources/request/usuarios/registrarUsuario.schema.json')
        * def usuario = Java.type('karate.models.Usuario')


    @status201
    Scenario Outline: Verificar registro de nuevo usuario - Success-"<CP>"
        *  body.post.nome = "<nome>"
        *  body.post.email = "<email>"
        *  body.post.password = "<password>"
        *  body.post.administrador = "<administrador>"
        Given path '/usuarios'
        And request body.post
        When method post
        Then status 201
        And match response == schema.post["201"]
        * if(__num == 0){usuario.limpiarCsv()}
        * usuario.registrarEnCsv(response._id)

        Examples:
            | CP |nome|email|password|administrador|
            |  Registro como usuario administrador  | Fulano da Silva5    |  beltrano100286@qa.com.br   |  teste      |  true |
        #    |  Registro como usuario no administrador  | Fulano da Silva6    |  beltrano100283@qa.com.br   |  teste       |  true|

    @status400
    Scenario Outline: Verificar que no se pueda registrar un usuario ya registrado-"<CP>"
        *  body.post.nome = "<nome>"
        *  body.post.email = "<email>"
        *  body.post.password = "<password>"
        *  body.post.administrador = "<administrador>"
        Given path '/usuarios'
        And request body.post
        When method post
        Then status 400
        And match response == schema.post["400"]

        Examples:
            |read('classpath:resources/response/usuarios/obtenerUsuario.csv') |


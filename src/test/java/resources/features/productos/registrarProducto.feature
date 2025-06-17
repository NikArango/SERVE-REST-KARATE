@registrarProducto
Feature: Registro de productos a traves de SERVEREST
    Como un administrador del sistema,
    quiero poder registrar productos a través de la API,
    para administrar la base de datos de productos.

    Background:
        * def body = read('classpath:resources/request/productos/registrarProducto.body.json')
        * def schema = read('classpath:resources/request/productos/registrarProducto.schema.json')
        * def login = read('classpath:resources/response/usuarios/loginUsuario.csv')
        * def producto = Java.type('karate.models.Producto')

        * url baseUrl
        * header Content-Type = 'application/json'
        * header Authorization = login[0].authorization


    @status201
    Scenario Outline: Verificar registro de nuevo producto - Success-"<CP>"
        * def usuarios = read('classpath:resources/response/usuarios/registrarUsuario.csv')
        * body.post.nome = "<nome>"
        * body.post.preco = "<preco>"
        * body.post.descricao = "<descricao>"
        * body.post.quantidade = usuarios.length
        Given path '/produtos'
        And request body.post
        When method post
        Then status 201
        And match response == schema.post["201"]
        * if(__num == 0){producto.limpiarCsv()}
        * producto.registrarEnCsv(response._id)


        Examples:
            | CP |nome                  |preco  |descricao  |
            |  1  | Funda de laptop3333    |  10   |  Funda de laptop       |
            |  2  | Cargador de laptop3333    |  20   |  Cargador de laptop  |


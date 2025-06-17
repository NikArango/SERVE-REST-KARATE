@registrarCarrito
Feature: Registro de carrito a traves de SERVEREST
  Como cliente de SERVEREST,
  quiero poder registrar mi carrito a través de la API,
  para realizar la compra de productos.

  Background:
    * def body = read('classpath:resources/request/carritos/registrarCarrito.body.json')
    * def schema = read('classpath:resources/request/carritos/registrarCarrito.schema.json')

    * url baseUrl
    * header Content-Type = 'application/json'

  @status201
  Scenario Outline: Verificar registro de carrito - Success-"<CP>"
    *  header Authorization = "<authorization>"
    *  def productosRecibidos = read('classpath:resources/response/productos/registrarProductos.csv')
    *  body.post.produtos[0].idProduto = productosRecibidos[0].id
    Given path '/carrinhos'
    And request body.post
    When method post
    Then status 201
    And match response == schema.post["201"]

    Examples:
      |read('classpath:resources/response/usuarios/loginUsuario.csv') |


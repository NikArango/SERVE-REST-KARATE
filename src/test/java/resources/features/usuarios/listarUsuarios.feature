@listarUsuarios
Feature: Listar usuarios a traves de SERVEREST
    Como un administrador del sistema,
    quiero poder listar usuarios a través de la API,
    para administrar la base de datos de usuarios.

    Background:
        * url baseUrl
        * header Content-Type = 'application/json'

        * def schema = read('classpath:resources/request/usuarios/listarUsuarios.schema.json')

    
   @status200
    Scenario: Verificar listado de usuarios exitoso
        * def schema1 = schema
        * set schema1.get["200"].usuarios = '#[]'
        Given path '/usuarios'
        When method get
        Then status 200
        And match response == schema1.get["200"]
        And def usuarios = response.usuarios
        And if (usuarios.length > 0) karate.forEach(usuarios, function(x){ if (! karate.match(x, schema.get["200"].usuarios[0]).pass)            karate.fail('Validacion fallida para esquema de usuarios' )})
        And match  response.quantidade == usuarios.length

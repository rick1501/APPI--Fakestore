Feature: FakeStore API - Pruebas Completas

  Background:
    * url 'https://fakestoreapi.com'

  Scenario: Validate products API
    Given url 'https://fakestoreapi.com'
    And path 'products/category/electronics'
    When method get
    Then status 200
    And match response == '#[]'
    And match each response contains { id: '#number', title: '#string', price: '#number', category: 'electronics' }


  Scenario: Consultar un producto específico
    Given path 'products', 1
    When method GET
    Then status 200
    And match response contains { id: 1 }

  Scenario: Crear un producto y actualizarlo
    * def newProduct =
    """
    {
      "title": "QA Karate Product",
      "price": 99.99,
      "description": "Created via Karate",
      "image": "https://i.pravatar.cc",
      "category": "electronics"
    }
    """
    Given path 'products'
    And request newProduct
    When method POST
    Then status 201
    * def createdId = response.id

    # Actualizar imagen
    Given path 'products', createdId
    And request { image: 'https://picsum.photos/200' }
    When method PUT
    Then status 200
    And match response.image == 'https://picsum.photos/200'

  Scenario Outline: Validar listado por categorías
    Given path 'products/category', <categoria>
    When method GET
    Then status 200
    And match each response[*].category == <categoria>

    Examples:
      | categoria         |
      | "electronics"     |
      | "jewelery"        |
      | "men's clothing"  |
      | "women's clothing"|


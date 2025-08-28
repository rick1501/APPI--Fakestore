Feature: FakeStore API - Pruebas Completas

  Background:
    * url 'https://fakestoreapi.com'

  Scenario: Listar productos de la categoría electronics
    Given path 'products/category/electronics'
    When method GET
    Then status 200
    And match response == '#[]'
    * assert response.length > 0
    And match each response[*].category == 'electronics'



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
      "description": "Created  by rick",
      "image": "https://i.pravatar.cc",
      "category": "electronics"
    }
    """
    Given path 'products'
    And request newProduct
    When method POST
    Then status 201
    * def createdId = response.id


    Given path 'products', createdId
    And request { image: 'https://picsum.photos/200' }
    When method PUT
    Then status 200
    And match response.image == 'https://picsum.photos/200'


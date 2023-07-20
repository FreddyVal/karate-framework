Feature: Validaciones rest PetStore

  @regresivo
  Scenario Outline: Consulta mascotas disponibles
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=<estado>'
    When method GET
    And match response[0].name == '#string'
    And match response[0].category.id == 0
    Then status 200

    Examples:
      | estado      |
      | available   |

  Scenario: Crear orden
    Given url 'https://petstore.swagger.io/v2/store/order'
    When request
    """
    {
        "id": 1,
        "petId": 1,
        "quantity": 1,
        "shipDate": "2022-04-21T00:55:29.817Z",
        "status": "placed",
        "complete": true
    }
    """
    And method POST
    Then status 200


  Scenario Outline: Eliminar orden
    Given url 'https://petstore.swagger.io/v2/store/order/<orden>'
    When method DELETE
    Then status 200

    Examples:
      | orden |
      |  53    |


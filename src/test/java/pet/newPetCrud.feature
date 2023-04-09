Feature: /pet/findByStatus find pets by status

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }
    * def newPet =
        """
    {
      "id": 191919,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "tomcat",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
        """
    * def newPetPatch =
        """
    {
      "id": 191919,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "Tomcatotto",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
        """

  Scenario: check id=191919 free
    Given path 'pet/191919'
    When method get
    Then status 404
    And match response == {"code": 1,"type": "error","message": "Pet not found"}

  Scenario: create new pet with id=191919
    Given path 'pet'
    And request body = newPet
    When method post
    Then status 200

  Scenario: patch new pet
    Given path 'pet'
    And request body = newPetPatch
    When method put
    Then status 200

  Scenario: check new name id=191919
    Given path 'pet/191919'
    When method get
    Then status 200
    And match response.name == "Tomcatotto"

  Scenario: delete pet id=191919
    Given path 'pet/191919'
    When method delete
    Then status 200
    And match response == {"code": 200,"type": "unknown","message": "191919"}

  Scenario: check pet id=191919 removed
    Given path 'pet/191919'
    When method get
    Then status 404
    And match response == {"code": 1,"type": "error","message": "Pet not found"}
Feature: /pet/findByStatus find pets by status

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario Outline: find pets by status
    Given path 'pet/findByStatus'
    And param status = <statusString>
    When method get
    Then status <responseCode>
    Examples:
      | statusString | responseCode |
      | 'pending'    | 200          |
      | 'available'  | 200          |
      | 'sold'       | 200          |

  Scenario Outline: find pets by status negative
    Given path 'pet/findByStatus'
    And param status = <statusString>
    When method get
    Then status <responseCode>
    And match response == <matchResponse>
    Examples:
      | statusString | responseCode | matchResponse |
      | 'penggg'     | 200          | []            |
      | 123456       | 200          | []            |
      | '@@££!!'     | 200          | []            |
Feature: Returns pet inventories by status

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }

  Scenario: get store inventory
    Given path 'store/inventory'
    When method get
    Then status 200
    And print response
    And match response ==
    """
    {
      "sold": "#number",
      "string": "#number",
      "pending": "#number",
      "available": "#number",
      "not available": "#number",
      "Available": "#number"
    }
    """


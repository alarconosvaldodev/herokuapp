Feature: Ejercicio 4 - Actualizar un booking usando token de archivo

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

    # Leer token desde el archivo generado por CreateToken.feature
    * def tokenFile = karate.read('token.json')
    * def authToken = tokenFile.token

  Scenario: Actualizar booking 1
    # Crear un booking
    Given path 'booking'
    And request
      """
      {
        "firstname": "Ana",
        "lastname": "Suarez",
        "totalprice": 250,
        "depositpaid": true,
        "bookingdates": { "checkin": "2023-08-01", "checkout": "2023-08-15" },
        "additionalneeds": "Desayuno"
      }
      """
    When method post
    Then status 200
    * def bookingId = response.bookingid

  Scenario: Actualizar booking 2
    Given path 'booking'
    And request
      """
      {
        "firstname": "Ana",
        "lastname": "Ramirez",
        "totalprice": 300,
        "depositpaid": false,
        "bookingdates": { "checkin": "2023-09-01", "checkout": "2023-09-10" },
        "additionalneeds": "Cena"
      }
      """
    When method put
    Then status 200
    And match response.lastname == "Ramirez"
    And match response.totalprice == 300

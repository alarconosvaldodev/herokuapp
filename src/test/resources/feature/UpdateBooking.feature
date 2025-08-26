Feature: Ejercicio 4 - Actualizar un booking usando token de archivo

  Background:
    * def tokenFile = karate.read('file:target/files/token.json')
    * def bookingData1 = karate.read('file:target/files/booking1.json')
    * def bookingData2 = karate.read('file:target/files/booking2.json')
    * def authToken = tokenFile.token
    * def bookingId1 = +bookingData1.bookingId1
    * def bookingId2 = +bookingData2.bookingId2

    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * header Cookie = 'token='+ authToken


  Scenario: Actualizar booking 1
    Given path 'booking', bookingId1
    And request
      """
      {
        "firstname": "Jose",
        "lastname": "Gutierrez Mora",
        "totalprice": 100,
        "depositpaid": true,
        "bookingdates": { "checkin": "2023-05-12", "checkout": "2023-06-28" },
        "additionalneeds": "Comics"
      }
      """
    When method put
    Then status 200
    And match response.firstname == "Jose"

  Scenario: Actualizar booking 2
    Given path 'booking', bookingId1
    And header Cookie = 'token='+ authToken
    And request
      """
      {
        "firstname": "Javier",
        "lastname": "Gutierrez Mora",
        "totalprice": 356,
        "depositpaid": true,
        "bookingdates": { "checkin": "2023-06-20", "checkout": "2023-07-20" },
        "additionalneeds": "Terror"
      }
      """
    When method put
    Then status 200
    And match response.firstname == "Javier"

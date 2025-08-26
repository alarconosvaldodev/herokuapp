Feature: Ejercicio 2 - Crear Bookings

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Crear booking uno
    # ---- Booking 1 ----
    Given path 'booking'
    And request
      """
      {
        "firstname": "Pedro",
        "lastname": "Gutierrez",
        "totalprice": 100,
        "depositpaid": true,
        "bookingdates": { "checkin": "2023-03-01", "checkout": "2023-04-01" },
        "additionalneeds": "Comics"
      }
      """
    When method post
    Then status 200
    And match response.booking.firstname == "Pedro"
    * def bookingId1 = response.bookingid

    * def fs = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
    * def content = '{ "bookingId1": "' + bookingId1 + '" }'
    * fs.write(Paths.get('target/files/booking1.json'), content.getBytes())

    # ---- Booking 2 ----
  Scenario: Crear booking dos
    Given path 'booking'
    And request
      """
      {
        "firstname": "Javier",
        "lastname": "Jaramillo",
        "totalprice": 356,
        "depositpaid": true,
        "bookingdates": { "checkin": "2023-03-15", "checkout": "2023-04-15" },
        "additionalneeds": "Terror"
      }
      """
    When method post
    Then status 200
    And match response.booking.firstname == "Javier"
    * def bookingId2 = response.bookingid

    * def fs = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
    * def content = '{ "bookingId2": "' + bookingId2 + '" }'
    * fs.write(Paths.get('target/files/booking2.json'), content.getBytes())

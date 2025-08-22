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

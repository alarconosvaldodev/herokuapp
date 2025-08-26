Feature: Ejercicio 3 - Consultar Bookings

  Background:
    * url 'https://restful-booker.herokuapp.com'

  Scenario: Obtener booking uno
    * def bookingData = karate.read('file:target/files/booking1.json')
    * def bookingId1 = bookingData.bookingId1

    * karate.pause(2000)
    # ---- Booking 1 ----
    Given path 'booking', bookingId1
    When method get
    Then status 418
    And match response.firstname == "Pedro"

  Scenario: Obtener booking dos

    * def bookingData = karate.read('file:target/files/booking2.json')
    * def bookingId2 = bookingData.bookingId2

    # ---- Booking 2 ----
    Given path 'booking', bookingId2
    When method get
    Then status 418
    And match response.firstname == "Javier"

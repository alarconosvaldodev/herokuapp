Feature: Ejercicio 3 - Consultar Bookings

  Background:
    * url 'https://restful-booker.herokuapp.com'

  @ejercicio3
  Scenario: Consultar los bookings creados
    * def bookingId1 = karate.get('bookingId1', 1)  # Placeholder si se quiere compartir con un .json o karate.call
    * def bookingId2 = karate.get('bookingId2', 2)

    # ---- Booking 1 ----
    Given path 'booking', bookingId1
    When method get
    Then status 200
    And match response.firstname == "Pedro"

    # ---- Booking 2 ----
    Given path 'booking', bookingId2
    When method get
    Then status 200
    And match response.firstname == "Javier"

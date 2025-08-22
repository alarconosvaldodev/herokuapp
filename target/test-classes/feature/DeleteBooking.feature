Feature: Ejercicio 4 - Eliminar un booking

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

    # ⚡ Generar token para operaciones protegidas
    Given path 'auth'
    And request
      """
      {
        "username": "admin",
        "password": "password123"
      }
      """
    When method post
    Then status 200
    * def authToken = response.token

  @ejercicio4
  Scenario: Eliminar un booking existente
    # Primero creo un booking para luego eliminarlo
    Given path 'booking'
    And request
      """
      {
        "firstname": "Luis",
        "lastname": "Martinez",
        "totalprice": 200,
        "depositpaid": true,
        "bookingdates": { "checkin": "2023-07-01", "checkout": "2023-07-10" },
        "additionalneeds": "Desayuno"
      }
      """
    When method post
    Then status 200
    * def bookingId = response.bookingid

    # Ahora elimino el booking con el token
    Given path 'booking', bookingId
    And header Cookie = 'token=' + authToken
    When method delete
    Then status 201

    # Verifico que realmente fue eliminado
    Given path 'booking', bookingId
    When method get
    Then status 404

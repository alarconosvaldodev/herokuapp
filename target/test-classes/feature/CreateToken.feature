Feature: Crear Token y guardarlo en archivo

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'

  @createToken
  Scenario: Generar token y guardarlo en archivo
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
    * def token = response.token

    * def fs = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
    * def content = '{ "token": "' + token + '" }'
    * fs.write(Paths.get('target/files/token.json'), content.getBytes())

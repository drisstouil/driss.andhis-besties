#Author: driss touil and anasse el hazime driss keda and simo hmied
@gitHub
Feature: gitHub

  Scenario: gitHub Practice generate valid token with valid user and password
  
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response.token

  Scenario: generate token with invalid username and password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor1","password": "tek_supervisor"}
    When method post
    Then status 404
    * def errorMessage = response.errorMessage
    And assert errorMessage == "USER_NOT_FOUND"
    
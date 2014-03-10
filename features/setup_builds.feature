Feature: Setup builds

  In order to have an awesome tollchain to build my software
  As a software developer
  I want to add my application build scripts to codecanoe

  Scenario: Create an application
    Given I am signed up
    When I create my "facebook killer" app
    Then my application should be present

  #Scenario: Add a build script to an application
    #Given I am signed up
    #And my "facebook killer" app was created
    #When I add a build script to my application
    #Then I the script should be visible on my app page

  #Scenario: Run a build
    #Given I am signed up
    #And my "facebook killer" app was created
    #And a build script is associated with my application
    #When I run a build of my application
    #Then I should see my build status

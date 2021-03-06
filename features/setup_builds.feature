Feature: Setup builds

  In order to have an awesome tollchain to build my software
  As a registered software developer
  I want to add my application build configurations to codecanoe

  Scenario: Create an application
    Given I am signed up
    When I create my "facebook killer" app
    Then my application should be present

  Scenario: User applications
    Given I am signed in
    And my "facebook killer" app was created
    And someone else has a "twitter killer" app
    When I open my apps
    Then my application should be present
    And someone elses application should not be present

  Scenario: Add a build script to an application
    Given I am signed in
    And my "facebook killer" app was created
    When I add a build configuration to my application
    Then my build configuration should be visible on my app page

  Scenario: Edit a build script
    Given I am signed in
    And my "facebook killer" app with a "default" build configuration was created
    When I edit my build configuration
    Then my build configuration should be visible on my app page

  Scenario: Delete a build script
    Given I am signed in
    And my "facebook killer" app with a "default" build configuration was created
    When I delete my build configuration
    Then my build configuration should not be visible on my app page

  Scenario: Run a build
    Given I am signed in
    And my "facebook killer" app with a "default" build configuration was created
    When I run my build of my application
    Then I should see my build running

  Scenario: A build finished successfully
    Given I am signed in
    And a build finished successfully
    Then I should see that my build succeeded
    And I should receive an build succeeded email notification

  Scenario: A build failed
    Given I am signed in
    And a build failed
    Then I should see that my build failed
    And I should receive an build failed email notification

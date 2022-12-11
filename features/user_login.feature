Feature: Login and Register page of Columbia Dining++

  As a Columbia University student
  So that I want to register an account and login to Columbia Dining++

Background: Users have been added to database

  Given the following users exist:
  | username | password_digest|
  | jp4081   | jp4081         |
  | zc2569   | zc2569         |
  | zd2263   | zd2263         |
  | yy3089   | yy3089         |

  And I am on the Columbia Dining plus plus login page
  Then 4 seed users should exist

Scenario: login with accounts in database
  And I fill in "Username" with "jp4081"
  And I fill in "Password" with "jp4081"
  And I follow "Login"
  And I should be on the dishes page

Scenario: create accounts and login with this account
  When I am on the Columbia Dining plus plus register page
  And I fill in "Username" with "user"
  And I fill in "Password" with "password"
  And I press "Create Account"
  And I should be on the login page
  And I fill in "Username" with "user"
  And I fill in "Password" with "password"
  And I follow "Login"
  And I should be on the dishes page
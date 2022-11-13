Feature: add, delete and show dishes in Columbia Dining menu

  As a Columbia University student
  So that I want to know the dishes among all Columbia dining halls
  I want to add, delete and show dishes in Columbia dining halls

Background: dishes have been added to database

  Given the following dishes exist:
  | name              | hall                 | property    | calories |
  | Roasted Pork Loin | Ferris Booth Commons | normal      | 100      |
  | Yello Rice        | John Jay             | gluten free | 140      |
  | Vegetable Medley  | Ferris Booth Commons | halal       | 60       |
  | Fish and Chips    | JJ                   | normal      | 220      |

  And I am on the Columbia Dining plus plus home page
  Then 4 seed dishes should exist

Scenario: show number of total dishes in database
  When I am on the Columbia Dining plus plus home page
  And I should see "Roasted Pork Loin"
  And I should see "Yello Rice"
  And I should see "Roasted Pork Loin"
  And I should see "Vegetable Medley"
  And I should see "Fish and Chips"

Scenario: add new dishes in database
  When I follow "Add new dish"
  And I should see "Create New Dish"
  And I fill in "Name" with "Marinara Sauce"
  And I select "John Jay" from "Hall"
  And I fill in "Property" with "halal"
  And I fill in "Calories" with "120"
  And I press "Save Changes"
  And I should see "Marinara Sauce"
  
Scenario: see details about dishes in database
  When I follow "More about Yello Rice"
  And I should see "Details about Yello Rice"
  And I should see "Name: Yello Rice"
  And I should see "Hall: John Jay"

Scenario: edit details about dishes in database
  When I follow "More about Yello Rice"
  And I follow "Edit"
  And I fill in "Name" with "Yellow Rice"
  And I select "John Jay" from "Hall"
  And I fill in "Property" with "gluten free"
  And I fill in "Calories" with "140"
  And I press "Update Dish Info"
  And I follow "Back to dish list"
  And I should see "Yellow Rice"
  And I should not see "Yello Rice"

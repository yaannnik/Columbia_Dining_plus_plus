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
  When I follow "new"
  And I should see "Create New Dish"
  And I fill in "name" with "Marinara Sauce"
  And I select "John Jay" from "hall"
  And I fill in "property" with "halal"
  And I fill in "calories" with "120"
  And I press "Save Changes"
  And I should see "Marinara Sauce"
  

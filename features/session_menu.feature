Feature: test Coockie for Columbia Dining menu

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

Scenario: sort dishes according to their calories then select a hall
  And I should see "Roasted Pork Loin" before "Vegetable Medley"
  When I follow "Calories"
  Then I select "Ferris Booth Commons" from "cur_hall"
  Then I should see "Vegetable Medley" before "Roasted Pork Loin"

Scenario: edit a dish after sorting dishes according to their calories then selecting a hall
  And I should see "Roasted Pork Loin" before "Vegetable Medley"
  When I follow "Calories"
  Then I select "Ferris Booth Commons" from "cur_hall"
  Then I should see "Vegetable Medley" before "Roasted Pork Loin"
  Then I follow "Roasted Pork Loin"
  And I follow "Edit"
  And I fill in "Name" with "Roasted Pork Loin"
  And I select "Ferris Booth Commons" from "Hall"
  And I fill in "Property" with "normal"
  And I fill in "Calories" with "50"
  And I press "Update Dish Info"
  And I follow "Back to dish list"
  Then I should see "Roasted Pork Loin" before "Vegetable Medley"
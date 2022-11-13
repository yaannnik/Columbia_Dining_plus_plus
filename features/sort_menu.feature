Feature: sort dishes in Columbia Dining menu

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

Scenario: sort dishes according to their calories
  When I follow "Calories"
  Then I should see "Vegetable Medley" before "Roasted Pork Loin"
  Then I should see "Roasted Pork Loin" before "Yello Rice"
  Then I should see "Yello Rice" before "Fish and Chips"

Scenario: sort dishes according to their properties
  When I follow "Property"
  Then I should see "Yello Rice" before "Vegetable Medley"
  Then I should see "Vegetable Medley" before "Roasted Pork Loin"
  Then I should see "Roasted Pork Loin" before "Fish and Chips"
Feature: filter dishes in Columbia Dining menu

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


Scenario: show dishes in "John Jay's hall"
  When I select "John Jay" from "cur_hall"
  And I press "choose hall"
  And I should see "Yello Rice"
  And I should not see "Roasted Pork Loin"
  And I should not see "Vegetable Medley"
  And I should not see "Fish and Chips"

Scenario: show dishes in "JJ hall"
  When I select "JJ" from "cur_hall"
  And I press "choose hall"
  And I should not see "Yello Rice"
  And I should not see "Roasted Pork Loin"
  And I should not see "Vegetable Medley"
  And I should see "Fish and Chips"

Scenario: show dishes in "Ferris Booth Commons hall"
  When I select "Ferris Booth Commons" from "cur_hall"
  And I press "choose hall"
  And I should not see "Yello Rice"
  And I should see "Roasted Pork Loin"
  And I should see "Vegetable Medley"
  And I should not see "Fish and Chips"
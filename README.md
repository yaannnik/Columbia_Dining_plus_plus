#Columbia Dining++



###Team Members

Member 1 Name: Jing Peng
Member 1 UNI: jp4081

Member 2 Name: Zhenrui Chen
Member 2 UNI: zc2569

Member 3 Name: Zhibo Dai
Member 3 UNI: zd2263

Member 4 Name: Yi Yang
Member 4 UNI: yy3089



###Environment

- ruby --version == 2.6.0
- rails --version == 4.2.11



### User Stories

In iter1 for our SaaS project, the user stories we cover are for the home page and adding new dishes into our database. We designed tow senarios for our iter1. The first one is that uses should be able to see all dishes and their information on the home page for all seeded dishes. The second one is that users should be able to add new dishes to our SaaS.

```
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
  
```





### Instruction

####Run

First run `bundle install` to install all necessary dependencies;

Then run `rake db:migrate` and `rake db:seed` to migrate database and seed data into the database;

Use `rails server -b 0.0.0.0` to start our SaaS.



####Test

To test the user stories written in Cucumber, run `rake cucumber` to see the test results.

To run Rspec tests for our code, run `rake spec` to see the test results.

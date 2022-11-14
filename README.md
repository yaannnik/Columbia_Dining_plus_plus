# Columbia Dining++

### Team Members

Member 1 Name: Jing Peng
Member 1 UNI: jp4081

Member 2 Name: Zhenrui Chen
Member 2 UNI: zc2569

Member 3 Name: Zhibo Dai
Member 3 UNI: zd2263

Member 4 Name: Yi Yang
Member 4 UNI: yy3089



### Environment

- ruby --version == 2.6.0
- rails --version == 4.2.11



### User Stories

In iter2 for our SaaS project, the user stories we cover including 4 features: `manage`, `filter`, `sort `the dishes in Columbia Dining menu and save the `session`. We designed corresponding 4 senarios for our iter2:

1. The first one is that uses should be able to see all dishes and their information on the home page for all seeded dishes and our users should be able to `add`, `edit`, `delete` dishes to our SaaS; 
2. `Filtering` is the feature that our users are able to `filter the dishes` by different dining halls at Columbia University.
3. `Sorting` is to allow our users to sort the dishes by `calories` or food `propeties`.
4. `Session` is the feature that we use to save the cache of `old choices` of sort/filter.

__Home page__
-  `Add`, `delete` and `show` dishes in Columbia Dining menu

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
  When I follow "Add new dish"
  And I should see "Create New Dish"
  And I fill in "name" with "Marinara Sauce"
  And I select "John Jay" from "hall"
  And I fill in "property" with "halal"
  And I fill in "calories" with "120"
  And I press "Save Changes"
  And I should see "Marinara Sauce"
  
Scenario: see Details about dishes in database
  When I follow "More about Yello Rice"
  And I should see "Details about Yello Rice"
  And I should see "Name: Yello Rice"
  And I should see "Hall: John Jay"
  
```


-  `Filter dishes` in Columbia Dining menu by different halls

```
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

Scenario: show dishes in "All"
  When I select "All" from "cur_hall"
  And I press "choose hall"
  And I should see "Yello Rice"
  And I should see "Roasted Pork Loin"
  And I should see "Vegetable Medley"
  And I should see "Fish and Chips"

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

```

- `Sort dishes` in Columbia Dining menu by propeties/calories

```
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
```

- `Session`

```
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
```


### Instruction

#### Run

First run `bundle install` to install all necessary dependencies;

Then run `rake db:migrate` and `rake db:seed` to migrate database and seed data into the database;

Use `rails server -b 0.0.0.0` to start our SaaS.



#### Test

Our tests covers all the pages we have finished developed: the home page, the add page for new dishes and the show page for different dishes.

To test the user stories written in Cucumber, run `rake cucumber` to see the test results.

To run Rspec tests for our code, run `rake spec` to see the test results.


### Deployment

See our deployment on https://guarded-river-21686.herokuapp.com/dishes
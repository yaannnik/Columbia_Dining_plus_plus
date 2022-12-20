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

In launch for our SaaS project, the user stories we cover including 4 features: `manage`, `filter`, `sort `the dishes in Columbia Dining menu and save the `session`, and for the users in our system, we cover the `register`and `login` features for our user stories . We designed the follwoing user stories for our SaaS application:

1. The first one is that uses should be able to see all dishes and their information on the home page for all seeded dishes and our users should be able to `add`, `edit`, `delete` dishes to our SaaS; 
2. `Filtering` is the feature that our users are able to `filter the dishes` by different dining halls at Columbia University.
3. `Sorting` is to allow our users to sort the dishes by `calories` or food `propeties`.
4. `Session` is the feature that we use to save the cache of `old choices` of sort/filter.
5. `User Features` for the login and register functions.

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

- `User features`

```
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
```



### Instruction

#### Run

First run `bundle install` to install all necessary dependencies;

Then run `rake db:migrate` and `rake db:seed` to migrate database and seed data into the database;

Use `rails server -b 0.0.0.0` to start our SaaS.

#### Login and Register

The home page for our SaaS application is the login page. You can first register an account in the register panel or login directly. The system will automatically add your username and password into our database if you are new to our application.

#### Dishes home page

All the dishes we have are listed on the homepage. Customers can select halls and see what is served in their selected position. Also customers are allowed to sort dishes according to their calories and properties.

In the homepage, customers can also edit, delete, add and see detailed information about different dishes.



#### Rspec Test

Our tests covers all the pages we have finished developed: the home page, the add page for new dishes and the show page for different dishes.

To test the user stories written in Cucumber, run `rake cucumber` to see the test results.

To run Rspec tests for our code, run `rake spec` to see the test results.

We have Rspec test cases for our models and controllers:

Model user:
```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'new' do
    it "takes parameters and returns a User object" do      
      @user = User.new(username: "user", password_digest: "password")
      expect(@user).to be_an_instance_of(User)
      expect(@user.username).to eq("user")
      expect(@user.password_digest).to eq("password")
    end
  end

  describe "add new user to database" do
    it "returns users added by customers" do
      User.delete_all
      user1 = { :username => "user1", :password_digest => "password" }
      user2 = { :username => "user2", :password_digest => "password" }
      User.create(user1)
      User.create(user2)

      result = User.all
      expect(result.find { |user| user[:username] == "user1" }).to_not be_nil
      expect(result.find { |user| user[:username] == "user2" }).to_not be_nil
    end

    it "avoid return dishes not in databse" do
      User.delete_all
      user1 = { :username => "user1", :password_digest => "password" }
      user2 = { :username => "user2", :password_digest => "password" }
      User.create(user1)
      User.create(user2)

      result = User.all
      expect(result.find { |user| user[:username] == "user3" }).to be_nil
    end
  end

  describe 'validation test' do
    it 'ensures password available' do
      user1 = User.new(username: 'user').save
      expect(user1).to eq(false)
    end
    it 'ensures username available' do
      user2 = User.new(password_digest: 'password').save
      expect(user2).to eq(false)
    end
    it 'should be true' do
      user3 = User.new(username:'user', password_digest:'password').save
      expect(user3).to eq(true)
    end
  end
  
end
```

Model dish:
```ruby
require 'rails_helper'

RSpec.describe Dish, type: :model do
    describe 'new' do
      it "takes parameters and returns a Dish object" do      
        @dish = Dish.new(name: "test_dish", hall: "John Jay", property: "normal", calories: 100, :image => "url")
        expect(@dish).to be_an_instance_of(Dish)
        expect(@dish.name).to eq('test_dish')
        expect(@dish.hall).to eq('John Jay')
        expect(@dish.property).to eq('normal')
        expect(@dish.calories).to eq(100)
      end
    end

    describe "add new dish to database" do
      it "returns dishes added by customers" do
        Dish.delete_all
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200, :image => "url2" }
        Dish.create(dish1)
        Dish.create(dish2)
  
        result = Dish.all
        expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
        expect(result.find { |dish| dish[:name] == "dish2" }).to_not be_nil
      end
  
      it "avoid return dishes not in databse" do
        Dish.delete_all
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200, :image => "url2" }
        Dish.create(dish1)
        Dish.create(dish2)
  
        result = Dish.all
        expect(result.find { |dish| dish[:name] == "dish3" }).to be_nil
      end
    end
  end

RSpec.describe Dish do
  describe "call with_hall" do
    it "returns dishes in the same hall" do
      Dish.delete_all
      dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
      dish2 = { :name => "dish2", :hall => "hall1", :property => "property2", :calories => 200, :image => "url2" }
      Dish.create(dish1)
      Dish.create(dish2)

      result = Dish.with_filter("hall1", "id")
      expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
      expect(result.find { |dish| dish[:name] == "dish2" }).to_not be_nil
    end

    it "avoid return dishes in another hall" do
        Dish.delete_all
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200, :image => "url2" }
        Dish.create(dish1)
        Dish.create(dish2)

        result = Dish.with_filter("hall1", "id")
      expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
      expect(result.find { |dish| dish[:name] == "dish2" }).to be_nil
    end

    it "returns dishes in all hall with hall params as nil" do
      Dish.delete_all
      Dish.all_halls
      dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
      dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200, :image => "url2" }
      Dish.create(dish1)
      Dish.create(dish2)

      result = Dish.with_filter(nil, "id")
      expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
      expect(result.find { |dish| dish[:name] == "dish2" }).to_not be_nil
    end
  end

  describe 'validation test' do
    it 'ensures name available' do
      dish1 = Dish.new(hall: 'hall', property: 'property', calories: 100).save
      expect(dish1).to eq(false)
    end
    it 'ensures hall available' do
      dish2 = Dish.new(name: 'name', property: 'property', calories: 100).save
      expect(dish2).to eq(false)
    end
    it 'ensures property available' do
      dish3 = Dish.new(name: 'name', hall: 'hall', calories: 100).save
      expect(dish3).to eq(false)
    end
    it 'ensures calories available' do
      dish4 = Dish.new(name: 'name', hall: 'hall', property: "property").save
      expect(dish4).to eq(false)
    end
    it 'should be true' do
      dish5 = Dish.new(name: 'name', hall: 'hall', property: "property", calories: 100).save
      expect(dish5).to eq(true)
    end
  end
end
```

DishesController:
```ruby
require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe DishesController, :type => :controller do
  describe "GET the home page" do
    it "renders the index page" do
        Dish.delete_all
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1"}
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200, :image => "url2" }
        Dish.create(dish1)
        Dish.create(dish2)
      get :index
      expect(response).to render_template("dishes/index")
    end
  end

  describe "GET the new page" do
    it "renders the new page" do
      get :new
      expect(response).to render_template("dishes/new")
    end
  end

  describe "POST a new dish" do
    it "redirects to the index page" do
      Dish.delete_all
      post :create, :dish => { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
      expect(response).to redirect_to dishes_path
    end
  end

  describe "GET the display page for a dish" do
    it "renders the show page" do
      Dish.delete_all
      dish1 = { :id => 1, :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100, :image => "url1" }
      dish2 = { :id => 2, :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200, :image => "url2" }
      Dish.create(dish1)
      Dish.create(dish2)
      get :show, :id => 1
      expect(response).to render_template("dishes/show")
    end
  end

  describe "GET the edit page for a dish" do
    it "renders the edit page" do
      Dish.delete_all
      dish1 = { :id => 1, :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
      Dish.create(dish1)
      get :edit, :id => 1
      expect(response).to render_template("dishes/edit")
    end
  end

end
```

UsersController:
```ruby
require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe UsersController, :type => :controller do
  describe "GET the new" do
    it "renders the new page" do
      User.delete_all
      user1 = { :username => "user1", :password_digest => "password" }
      user2 = { :username => "user2", :password_digest => "password" }
      User.create(user1)
      User.create(user2)
      get :new
      expect(response).to render_template("users/new")
    end
  end  

  describe "POST the create" do
    it "returns http success" do
      post :create, user: { username: "name", password: "password" } 
      expect(response).to have_http_status(302)
    end
  end 
end
```

SessionsController:
```ruby
require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe SessionsController, :type => :controller do
    describe "GET the show" do
      it "renders the new page" do
        User.delete_all
        user1 = { :username => "user1", :password_digest => "password" }
        user2 = { :username => "user2", :password_digest => "password" }
        User.create(user1)
        User.create(user2)
        get :show
        expect(response).to render_template("sessions/show")
      end
    end 
    
    describe "POST the create" do
      it "renders the new page" do
        User.delete_all
        user1 = { :username => "user1", :password_digest => "password" }
        user2 = { :username => "user2", :password_digest => "password" }
        User.create(user1)
        User.create(user2)
        post :create
        expect(response).to redirect_to("http://test.host/login")
      end
    end 
  end
```



### Deployment

See our deployment on https://guarded-river-21686.herokuapp.com

And our code is on GitHub repo https://github.com/yaannnik/Columbia_Dining_plus_plus
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
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200 }
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
      post :create, :dish => { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
      expect(response).to redirect_to dishes_path
    end
  end

  describe "GET the display page for a dish" do
    it "renders the show page" do
      Dish.delete_all
      dish1 = { :id => 1, :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
      dish2 = { :id => 2, :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200 }
      Dish.create(dish1)
      Dish.create(dish2)
      get :show, :id => 1
      expect(response).to render_template("dishes/show")
    end
  end

end
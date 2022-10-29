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

  # TODO: route for show page
#   describe "GET the display page for a dish" do
#     it "renders the show page" do
#       Dish.delete_all
#       dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
#       dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200 }
#       Dish.create(dish1)
#       Dish.create(dish2)
#       get :show, :name => "dish1"
#       expect(response).to render_template("dishes/show")
#     end
#   end

#   describe "GET the edit page" do
#     it "renders the edit page" do
#       Movie.delete_all
#       movie1 = { :id => 1, :title => "movie1", :rating => "R", :director => "director1" }
#       Movie.create(movie1)
#       get :edit, :id => 1
#       expect(response).to render_template("movies/edit")
#     end
#   end

#   describe "PUT an existing movie" do
#     it "redirects to the show page" do
#       Movie.delete_all
#       movie1 = { :id => 1, :title => "movie1", :rating => "R", :director => "director1" }
#       Movie.create(movie1)
#       post :update, :id => 1, :movie => {:id => 1, :title => "movie1_updated", :rating => "R", :director => "director1"}
#       expect(response).to redirect_to movie_path(1)
#     end
#   end

#   describe "DELETE an existing movie" do
#     it "redirects to the index page" do
#       Movie.delete_all
#       movie1 = { :id => 1, :title => "movie1", :rating => "R", :director => "director1" }
#       Movie.create(movie1)
#       delete :destroy, :id => 1
#       expect(response).to redirect_to movies_path
#     end
#   end

end
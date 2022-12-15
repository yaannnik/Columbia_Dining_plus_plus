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

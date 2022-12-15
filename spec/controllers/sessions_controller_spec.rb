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
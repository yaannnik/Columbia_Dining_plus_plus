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

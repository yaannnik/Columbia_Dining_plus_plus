require 'rails_helper'

RSpec.describe Dish do
    describe "add new dish to database" do
      it "returns dishes added by customers" do
        Dish.delete_all
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200 }
        Dish.create(dish1)
        Dish.create(dish2)
  
        result = Dish.all
        expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
        expect(result.find { |dish| dish[:name] == "dish2" }).to_not be_nil
      end
  
      it "avoid return dishes not in databse" do
          Dish.delete_all
          dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
          dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200 }
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
      dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
      dish2 = { :name => "dish2", :hall => "hall1", :property => "property2", :calories => 200 }
      Dish.create(dish1)
      Dish.create(dish2)

      result = Dish.with_hall("hall1")
      expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
      expect(result.find { |dish| dish[:name] == "dish2" }).to_not be_nil
    end

    it "avoid return dishes in another hall" do
        Dish.delete_all
        dish1 = { :name => "dish1", :hall => "hall1", :property => "property1", :calories => 100 }
        dish2 = { :name => "dish2", :hall => "hall2", :property => "property2", :calories => 200 }
        Dish.create(dish1)
        Dish.create(dish2)

      result = Dish.with_hall("hall1")
      expect(result.find { |dish| dish[:name] == "dish1" }).to_not be_nil
      expect(result.find { |dish| dish[:name] == "dish2" }).to be_nil
    end
  end
end
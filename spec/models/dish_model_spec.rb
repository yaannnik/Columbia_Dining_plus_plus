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
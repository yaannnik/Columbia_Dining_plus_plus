# Add a declarative step here for populating the DB with dishes.

Given /the following dishes exist/ do |dishes_table|
  dishes_table.hashes.each do |dish|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that dish to the database here.
    Dish.create(dish)
  end
  # pending "Fill in this step in dish_steps.rb"
end

Then /(.*) seed dishes should exist/ do | n_seeds |
  # expect(Dish.count).to eq n_seeds.to_i
  Dish.count.should be n_seeds.to_i
end

# Then /I seed name: (.*), hall: (.*), property: (.*), calories: (.*), image: (.*)/ do | name, hall, property, calories, image |
#   # expect(Dish.count).to eq n_seeds.to_i
#   Dish.create!(name: name, hall: hall, property: property, calories: calories.to_i, image: image)
# end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.to_s.index(e1)).to be < page.body.to_s.index(e2)
end

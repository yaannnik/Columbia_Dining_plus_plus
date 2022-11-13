# Add a declarative step here for populating the DB with movies.

Given /the following dishes exist/ do |dishes_table|
  dishes_table.hashes.each do |dish|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Dish.create(dish)
  end
  # pending "Fill in this step in movie_steps.rb"
end

Then /(.*) seed dishes should exist/ do | n_seeds |
  # expect(Movie.count).to eq n_seeds.to_i
  Dish.count.should be n_seeds.to_i
end

Then /I seed name: (.*), hall: (.*), property: (.*), calories: (.*)/ do | name, hall, property, calories |
  # expect(Movie.count).to eq n_seeds.to_i
  Dish.create!(name: name, hall: hall, property: property, calories: calories.to_i)
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.to_s.index(e1)).to be < page.body.to_s.index(e2)
  # pending "Fill in this step in movie_steps.rb"
end

### Utility Steps Just for this assignment.

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /^debug javascript$/ do
  # Use this to write "Then debug" in your scenario to open a JS console
  page.driver.debugger
  1
end


Then /complete the rest of of this scenario/ do
  # This shows you what a basic cucumber scenario looks like.
  # You should leave this block inside movie_steps, but replace
  # the line in your scenarios with the appropriate steps.
  fail "Remove this step from your .feature files"
end

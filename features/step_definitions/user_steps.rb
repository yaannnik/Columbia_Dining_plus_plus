Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        # each returned element will be a hash whose key is the table header.
        # you should arrange to add that dish to the database here.
        User.create(user)
    end
    # pending "Fill in this step in dish_steps.rb"
end

Then /(.*) seed users should exist/ do | n_seeds |
    # expect(Dish.count).to eq n_seeds.to_i
    User.count.should be n_seeds.to_i
end
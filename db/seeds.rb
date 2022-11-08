# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dishes = [
  { name: 'Roasted Pork Loin', hall: 'Ferris Booth Commons', property: 'normal', calories: 100, image: 'https://www.eatwell101.com/wp-content/uploads/2020/11/Pork-Tenderloin-Roast-1.jpg' },
  { name: 'Yellow Rice', hall: 'John Jay', property: 'gluten free', calories: 140, image: 'https://www.favfamilyrecipes.com/wp-content/uploads/2022/01/Yellow-Rice-5-840x560.jpg' },
  { name: 'Vegatable Medley', hall: 'Ferris Booth Commons', property: 'halal', calories: 60, image: 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/9/10/1/FN_Sauteed-Vegetable-Medley_H2_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568400650030.jpeg' },
  { name: 'Fish and Chips', hall: 'JJ', property: 'normal', calories: 220, image: 'https://media-cdn.tripadvisor.com/media/photo-s/0f/32/0f/7e/fish-and-chips-in-seal.jpg' },
]

dishes.each do |dish|
  Dish.create!(dish)
end

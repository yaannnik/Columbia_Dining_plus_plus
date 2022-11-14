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
  { name: 'Oatmeal with Milk', hall: 'John Jay', property: 'gluten free, halal, vegan', calories: 120, image: 'https://www.eatthis.com/wp-content/uploads/sites/4/2018/12/bowl-plain-oatmeal-milk-breakfast.jpg' },
  { name: 'Pork Sausage', hall: 'John Jay', property: 'gluten free', calories: 230, image: 'https://www.perduefarms.com/dw/image/v2/BDQM_PRD/on/demandware.static/-/Sites-masterCatalog_perdue/default/dwc4fa4422/images/product-images/B-MBSP22B3-B_6037_niman_ranch_apple_gouda_sausage_styled_ckd_5.png' },
  { name: 'Beef Rendang', hall: 'John Jay', property: 'normal', calories: 320, image: 'https://rasamalaysia.com/wp-content/uploads/2018/04/beef-rendang-thumb.jpg' },
  { name: 'Chipolet Roasted Chicken', hall: 'John Jay', property: 'normal', calories: 217, image: 'https://publish.purewow.net/wp-content/uploads/sites/2/2019/03/whole-roasted-chipotle-chicken-recipe.jpg' },
  { name: 'Black Beans', hall: 'John Jay', property: 'gluten free, halal, vegan', calories: 132, image: 'https://www.budgetbytes.com/wp-content/uploads/2010/06/Quick-Seasoned-Black-Beans-finished-500x500.jpg' },
  { name: 'Roasted Butternut Squash', hall: 'John Jay', property: 'normal', calories: 171, image: 'https://www.spendwithpennies.com/wp-content/uploads/2018/12/SpendWithPennies-Roasted-Butternut-Squash-23.jpg' },
  { name: 'Vegetable Roll', hall: 'John Jay', property: 'normal', calories: 193, image: 'https://steamykitchen.com/wp-content/uploads/2013/01/vegetable-egg-rolls-recipe-featured-1165-500x396.jpg' },
  { name: 'Spaghetti', hall: 'John Jay', property: 'vegan, halal', calories: 221, image: 'https://recipetineats.com/wp-content/uploads/2018/07/Spaghetti-Bolognese.jpg' },
  { name: 'Chicken Noodle Soup', hall: 'John Jay', property: 'normal', calories: 324, image: 'https://www.onceuponachef.com/images/2022/10/chicken-noodle-soup.jpg' },
  { name: 'Mashed Sweet Potatoes', hall: 'John Jay', property: 'normal', calories: 209, image: 'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2019/10/mashed-sweet-potato.jpg' },
  { name: 'Brussel Sprouts', hall: 'John Jay', property: 'gluten free, halal, vegan', calories: 36, image: 'https://images.immediate.co.uk/production/volatile/sites/30/2021/12/Bowl-of-sprouts-8305212.jpg' },
  { name: 'Farrow w./ Sundried Tomatoes', hall: 'John Jay', property: 'normal', calories: 193, image: 'https://www.skinnytaste.com/wp-content/uploads/2012/05/Farro-with-Feta-Cucumbers-and-Sun-Dried-Tomatoes-3.jpg' },
  { name: 'Caprese Grilled Cheese', hall: 'John Jay', property: 'normal', calories: 68, image: 'https://cafedelites.com/wp-content/uploads/2014/11/Caprese-Grilled-Cheese-Cafe-Delites-47-1.jpg' },
  { name: 'Minestrone Soup', hall: 'John Jay', property: 'normal', calories: 286, image: 'https://fitfoodiefinds.com/wp-content/uploads/2017/01/minestrone-soupsq.jpg' },
  { name: 'Meatball', hall: 'John Jay', property: 'normal', calories: 192, image: 'https://www.sandravalvassori.com/wp-content/uploads/2022/06/Grilled-chicken-drumsticks-102-2.jpg' },
  { name: 'Marinara Sauce', hall: 'John Jay', property: 'gluten free, halal, vegan', calories: 121, image: 'https://thecozyapron.com/wp-content/uploads/2020/04/marinara-sauce_thecozyapron_1.jpg' },
  { name: 'Grain bowl', hall: 'John Jay', property: 'normal', calories: 220, image: 'https://runningonrealfood.com/wp-content/uploads/2022/07/vegan-healthy-grain-bowl-with-kale-tempeh-quinoa-6.jpg' },
  { name: 'Whole Wheat Penne', hall: 'John Jay', property: 'vegan', calories: 126, image: 'https://www.grocery.coop/sites/default/files/Whole_Wheat_Penne_Pasta_with_Pumpkin_Sauce1.jpg' },
  { name: 'Jasmine Rice', hall: 'John Jay', property: 'gluten free, halal, vegan', calories: 83, image: 'https://healthynibblesandbits.com/wp-content/uploads/2018/10/Jasmine-Rice-Square-1.jpg' },
  { name: 'Lemon Cilantro Rice', hall: 'John Jay', property: 'normal', calories: 64, image: 'https://bellyfull.net/wp-content/uploads/2020/04/Cilantro-Lime-Rice-blog.jpg' },
  { name: 'Cannellini Beans', hall: 'John Jay', property: 'normal', calories: 98, image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-200511-seo-cannellini-beans-h-14438-eb-1590509620.jpg' },
  { name: 'Roasted Mushroom', hall: 'John Jay', property: 'vegan', calories: 103, image: 'https://www.dinneratthezoo.com/wp-content/uploads/2019/01/roasted-mushrooms-final-3.jpg' },
  { name: 'Diced Potatoes', hall: 'John Jay', property: 'vegan', calories: 193, image: 'https://www.recipevibes.com/wp-content/uploads/2021/03/Parmentier-Potatoes-picture.jpeg' },
  { name: 'Scrambled Eggs', hall: 'John Jay', property: 'normal', calories: 284, image: 'https://www.allrecipes.com/thmb/H4mfV9ZLigwMX_rbi4bOecA_I3w=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4100983-best-scrambled-eggs-Howard-4x3-1-e8f8ed38b51445babc19da1295ff6c03.jpg' },
  { name: 'JJ\'s Cheeseburger', hall: 'JJ', property: 'normal', calories: 543, image: 'https://leitesculinaria.com/wp-content/uploads/2013/01/classic-cheesburger-fp.jpg' },
  { name: 'JJ\'s Southwest Turkey Burger', hall: 'JJ', property: 'normal', calories: 533, image: 'https://www.eatthis.com/wp-content/uploads/sites/4/2019/01/low-calorie-southwest-turkey-burger.jpg' },
  { name: 'JJ\'s Beyond Meat Burger', hall: 'JJ', property: 'normal', calories: 400, image: 'https://hips.hearstapps.com/hmg-prod/images/0503-beyondburger2-1556899345.png' },
  { name: 'JJ\'s Grilled Chicken Sandwich', hall: 'JJ', property: 'normal', calories: 451, image: 'https://www.wellplated.com/wp-content/uploads/2014/07/French-Onion-Chicken-Sandwiches.jpg' },
  { name: 'Poblano Burger', hall: 'JJ', property: 'normal', calories: 931, image: 'https://houseofnasheats.com/wp-content/uploads/2018/05/Grilled-Poblano-Pepper-Southwest-Burgers-1386.jpg' },
  { name: 'JJ\'s Prosciutto, Mozzarella, Tomato, & Pesto Mayo', hall: 'JJ', property: 'normal', calories: 791, image: 'https://lenaskitchenblog.com/wp-content/uploads/2022/07/Prosciutto-and-Mozzarella-Sandwich-12-600x900.jpg' },
  { name: 'JJ\'s Pot Roast Po Boy with Mayo & Pickles', hall: 'JJ', property: 'normal', calories: 839, image: 'https://www.thebeardedhiker.com/wp-content/uploads/2017/07/poboy4.jpg' },
  { name: 'JJ\'s Vegan Pineapple Pancakes with Coconut Glaze', hall: 'JJ', property: 'normal', calories: 621, image: 'https://cdn.statically.io/img/whitneybond.com/f=auto/wp-content/uploads/2015/07/IMG_0186.jpg' },
  { name: 'JJ\'s Hot Honey Popcorn Chicken Quesadilla', hall: 'JJ', property: 'normal', calories: 691, image: 'https://www.howsweeteats.com/wp-content/uploads/2020/06/popcorn-chicken-10-500x500.jpg' },
  { name: 'Black Bean Poblano Burger', hall: 'JJ', property: 'normal', calories: 872, image: 'https://farm1.staticflickr.com/981/42229368101_ab8e359a4b_o.jpg' },
  { name: 'JJ\'s Onion Rings', hall: 'JJ', property: 'normal', calories: 391, image: 'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/7f539fc41a5543aebfe03afed73a0b48/BFV9112_MozzarellaStickOnionRings.jpg' },
  { name: 'Chickend Tenders', hall: 'JJ', property: 'normal', calories: 480, image: 'https://www.wellplated.com/wp-content/uploads/2021/10/Air-Fried-Chicken-Tenders.jpg' },
  { name: 'JJ\'s Curly Fries', hall: 'JJ', property: 'normal', calories: 493, image: 'https://cdn.theliveinkitchen.com/wp-content/uploads/2022/05/03150451/Frozen-Curly-Fries-Air-Fryer-The-Live-In-Kitchen-Featured.jpg' },
  { name: 'Cheese Blintz', hall: 'Ferris Booth Commons', property: 'vegetarian', calories: 328, image: 'https://bellyfull.net/wp-content/uploads/2020/07/Cheese-Blintzes-blog-3.jpg' },
  { name: 'Turkey Sausage', hall: 'Ferris Booth Commons', property: 'gluten free', calories: 346, image: 'https://www.africanbites.com/wp-content/uploads/2020/07/IMG_3546.jpg' },
  { name: 'Biscuits & Sausage Gravy', hall: 'Ferris Booth Commons', property: 'normal', calories: 412, image: 'http://www.cookingmamas.com/wp-content/uploads/2012/03/Country-Biscuits-Sausage-Gravy-1024x632.jpg' },
  { name: 'Pork Sausage', hall: 'Ferris Booth Commons', property: 'gluten free', calories: 337, image: 'https://www.omahasteaks.com/gifs/520x293/fr193.jpg' },
  { name: 'Tofu Sausage', hall: 'Ferris Booth Commons', property: 'gluten free, halal, vegan', calories: 159, image: 'https://i.ytimg.com/vi/oTLJxUD_E5k/maxresdefault.jpg' },
  { name: 'Beyond Sausage', hall: 'Ferris Booth Commons', property: 'gluten free, halal, vegan', calories: 188, image: 'https://www.costcuisine.com/wp-content/uploads/2022/06/beyond12.jpg' },
  { name: 'French Toast', hall: 'Ferris Booth Commons', property: 'vegetarian', calories: 244, image: 'https://altonbrown.com/wp-content/uploads/2020/08/French-Toast-Stack_Lynne_resized.jpg' },
  { name: 'O\'Brien Potatoes', hall: 'Ferris Booth Commons', property: 'normal', calories: 267, image: 'https://res.cloudinary.com/hksqkdlah/image/upload/19997_sfs-potatoesobrien-5.jpg' },
  { name: 'Scrambled Eggs', hall: 'Ferris Booth Commons', property: 'normal', calories: 187, image: 'https://kristineskitchenblog.com/wp-content/uploads/2021/11/best-scrambled-eggs-recipe-0815.jpg' },
  { name: 'Pork Bacon', hall: 'Ferris Booth Commons', property: 'normal', calories: 448, image: 'https://assets.epicurious.com/photos/630386df4eaa77f49a537aa5/2:3/w_3088,h_4632,c_limit/Brown_Sugar_Bacon_RECIPE_081722_38635.jpg' },
  { name: 'Oatmeal', hall: 'Ferris Booth Commons', property: 'halal', calories: 399, image: 'https://res.cloudinary.com/hksqkdlah/image/upload/10010_sfs-apple-cinnamon-oatmeal-3-1.jpg' },
  { name: 'Meatball Sub', hall: 'Chef Mike\'s Sub Shop', property: 'normal', calories: 298, image: 'https://www.mashed.com/img/gallery/homemade-meatball-sub-recipe/l-intro-1651075814.jpg' },
]
Dish.delete_all()
dishes.each do |dish|
  Dish.create!(dish)
end
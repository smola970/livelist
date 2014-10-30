# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Category.destroy_all
List.destroy_all
Goal.destroy_all

User.create username: 'lauren.smolenski' , password: 'ilovecake' , display_name: 'Lauren Smolenski' , email: 'lauren@smolenski.net.nz' , :password_confirmation => 'ilovecake'

User.create username: 'test.account' , password: 'ilovecake' , display_name: 'Test Account' , email: 'test@account.net.nz' , :password_confirmation => 'ilovecake'

%w(travel adventure career fitness/health self-development spiritual ethical/community romance other ).each do |name|
    Category.create name: name
  end

List.create name: 'Travel', :user_id => 1

Goal.create text: 'Eat gelato in Rome', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ak0.pinimg.com/736x/05/ca/f0/05caf027a89b8d481c8e87555432b3ad.jpg', caption: 'So delicious'

Goal.create text: 'Climb the Eifel Tower', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ak0.pinimg.com/736x/b9/35/9b/b9359b272736f94971da340a53a77a5f.jpg', caption: 'Amazing view!'

Goal.create text: 'See the pyramids in Egypt', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ak0.pinimg.com/736x/e8/d6/b7/e8d6b7a3428f3c9e1daac301b6985a64.jpg', caption: 'Breath taking...'

Goal.create text: 'Sunbathe in Positano, Italy', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ec0.pinimg.com/736x/68/7c/f1/687cf150a02e37358ce7a882b4b9b25d.jpg', caption: "I'm home"

Goal.create text: 'Stay the night in the middle of nowhere', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ak0.pinimg.com/736x/16/77/bd/1677bd175bd152342e6b6911a71f5d03.jpg', caption: "Was a bit cold but this morning view made up for it!"

Goal.create text: 'Do the Inca Trail', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ak0.pinimg.com/736x/68/8f/4a/688f4a1cd41837f5090ea1f0b6075770.jpg', caption: "Aliens exist"

Goal.create text: 'Yacht week', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ec0.pinimg.com/736x/c3/69/0f/c3690f4149525cafa230dd5c37f50270.jpg', caption: "We made it!"

Goal.create text: 'Oktoberfest', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-cd0.pinimg.com/736x/36/d2/6e/36d26e2d395047b9d7b53616b2bd0310.jpg', caption: "Crazy day, beer was had"

Goal.create text: 'Ride a hot air balloon in Turkey', user_id: 1, list_id: 1, category_id: 1, complete: true, image_url: 'http://media-cache-ak0.pinimg.com/736x/df/94/74/df94744fe35222818ea505d8ec436fd6.jpg', caption: "Sunrises will never be the same"


Goal.create text: 'Shop in New York', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'See a lion on a safari', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Reach base camp of Mount Everest', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Roadtrip around New Zealand with a friend', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Ski in Japan', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Do a winery tour in Provence', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Ride a double-decker bus in London', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Motorbike through Vietnam', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Visit a concentration camp', user_id: 1, list_id: 1, category_id: 1, complete: false

Goal.create text: 'Go to a real dinosaur museum', user_id: 1, list_id: 1, category_id: 1, complete: false









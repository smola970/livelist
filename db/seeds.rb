# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Category.destroy_all

User.create username: 'lauren.smolenski' , password: 'ilovecake' , display_name: 'Lauren Smolenski' , email: 'lauren@smolenski.net.nz' , :password_confirmation => 'ilovecake'


%w(travel adventure career fitness/health self-development spiritual ethical/community romance other ).each do |name|
    Category.create name: name
  end
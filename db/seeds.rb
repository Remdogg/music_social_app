# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create! :email => 'star@star.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Star', :last_name => 'Twinkle', :age => '67', :gender => 'female', :city => 'Orinda', :state => 'CA', :postal_code => '94563', :about => 'tight AF', :artists => '2chainz'

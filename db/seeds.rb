# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Category.destroy_all
category = Category.create!(title: 'Reference Book')
Product.create!(title: "Ruby Book", price: 25.9, description: "Learning ruby programming", published: true, category: category)
Product.create!(title: 'Jquery Book', price: 12.07, description: 'Learning jquery programming', published: true, category: category)
Product.create!(title: 'SCSS Book', price: 21.2, description: 'Learning scss', published: false, category: category)

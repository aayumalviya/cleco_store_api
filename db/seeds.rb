# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?





# categories = ['mens', 'women', 'kids']
# categories.each do |category|
#   Category.find_or_create_by(name: category)
# end

# mens_sub_categories = ['t-shirt', 'kurta', 'Hoodies']
# women_sub_categories = ['saree', 'suits']
# kids_sub_categories = ['jacket', 'blazzer']

# category = Category.find_by(name: 'mens')
# mens_sub_categories.each do |sub_category|
#   category.sub_categories.find_or_create_by(name: sub_category)
# end

# category = Category.find_by(name: 'women')
# women_sub_categories.each do |sub_category|
#   category.sub_categories.find_or_create_by(name: sub_category)
# end

# category = Category.find_by(name: 'kids')
# kids_sub_categories.each do |sub_category|
#   category.sub_categories.find_or_create_by(name: sub_category)
# end

# products = [
#   { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
#   { title: 'Women Printed Ethnic Dress', product_description: 'Women puffers to cleco store', price: 2199, old_price: 2499, exclusive_price: 1980, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
#   { title: 'Women Bandhani Ethnic Dress', product_description: 'Women puffers to cleco store', price: 2199, old_price: 2499, exclusive_price: 1980, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
#   { title: 'Women Printed Ethnic Dress', product_description: 'Women puffers to cleco store', price: 2299, old_price: 2599, exclusive_price: 2080, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
#   { title: 'Women Embroidered Ethnic Dress ', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
#   { title: 'Pack of 2 Women Printed Ethnic Dress ', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
#   { title: 'Self Design Kanjivaram Cotton Silk Saree', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
#   { title: 'Embroidered Bollywood Georgette Saree', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
#   { title: 'Printed, Striped, Embellished Bandhani Georgette Saree ', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
#   { title: 'Printed Daily Wear Chiffon Saree', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
#   { title: 'Woven Kanjivaram Pure Silk Saree', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
#   { title: 'Printed, Embellished Daily Wear Chiffon Saree ', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
#   { title: 'Kids Blazer Baby', product_description: 'Kids puffers to cleco store', price: 500, old_price: 700, exclusive_price: 400, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'blazzer', is_recommended: true, quantity: 5 },
#   { title: 'kids hooded zipper jacket', product_description: 'Kids puffers to cleco store', price: 999, old_price: 1499, exclusive_price: 1236, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'jacket', is_recommended: true, quantity: 5 },
#   { title: 'kids warm padded washable parka', product_description: 'Kids puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'jacket', is_recommended: true, quantity: 5 },
#   { title: 'kids Solid Tuxedo Style Festive & Wedding Blazer', product_description: 'Kids puffers to cleco store', price: 999, old_price: 1499, exclusive_price: 1236, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'blazzer', is_recommended: true, quantity: 5 },
#   { title: 'boys hooded zipper jacket', product_description: 'Kids puffers to cleco store', price: 999, old_price: 1499, exclusive_price: 1236, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'jacket', is_recommended: true, quantity: 5 }
# ]

# products.each do |product|
#   category = Category.find_by(name: product[:category])
#   sub_category = SubCategory.find_by(name: product[:sub_category])
#   Product.create(title: product[:title], product_description: product[:product_description], price: product[:price], old_price: product[:old_price], exclusive_price: product[:exclusive_price], product_details: product[:product_details], category_id: category.id, is_published: product[:is_published], sub_category: sub_category.id, is_recommended: product[:is_recommended], quantity: product[:quantity]  )
# end


@category = Category.create!(name: "mens")
debugger
@category.logo.attach(io: File.open("#{Rails.root.to_path}/public/elctronics.jpg"), filename: 'ethnicwear.jpg')
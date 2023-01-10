AdminUser.create!(email: 'admin5@example.com', password: 'password2', password_confirmation: 'password2')

categories = ['mens', 'women', 'kids']
categories.each do |cat|
  category = Category.find_or_create_by(name: cat)
	category.logo.attach(io: File.open("#{Rails.root.to_path}/public/#{cat}_category.jpg"), filename: 'ethnicwear.jpg')
end


mens_sub_categories = ['t-shirt', 'kurta', 'Hoodies']
women_sub_categories = ['saree', 'suits']
kids_sub_categories = ['jacket', 'blazzer']

puts 'Saving mens subcategories'
category = Category.find_by(name: 'mens')
mens_sub_categories.each do |sub_cat|
  puts "Subcategory: #{sub_cat}"
  sub_category = category.sub_categories.find_or_create_by(name: sub_cat)
  sub_category.logo.attach(io: File.open("#{Rails.root.to_path}/public/#{sub_cat}_sub_category.jpg"), filename: 'ethnicwear.jpg')
end
puts 'mens subcategories Saved'
puts ''

puts 'Saving women subcategories'
category = Category.find_by(name: 'women')
women_sub_categories.each do |sub_cat|
  puts "Subcategory: #{sub_cat}"
  sub_category = category.sub_categories.find_or_create_by(name: sub_cat)
  sub_category.logo.attach(io: File.open("#{Rails.root.to_path}/public/#{sub_cat}_sub_category.jpg"), filename: 'ethnicwear.jpg')
end
puts 'women subcategories saved'
puts ''


puts 'Saving kids subcategories'
category = Category.find_by(name: 'kids')
kids_sub_categories.each do |sub_cat|
  puts "Subcategory: #{sub_cat}"
  sub_category = category.sub_categories.find_or_create_by(name: sub_cat)
  sub_category.logo.attach(io: File.open("#{Rails.root.to_path}/public/#{sub_cat}_sub_category.jpg"), filename: 'ethnicwear.jpg')
end
puts 'kids subcategories saved'
puts ''

products = [
  { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Gangsta Jacket', product_description: 'Men puffers to cleco store', price: 2199, old_price: 2528, exclusive_price: 1980, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Batman: Classic Logo', product_description: 'Men puffers to cleco store', price: 2499, old_price: 2873, exclusive_price: 2250, product_details: 'very good product', category: 'mens', is_published: true, sub_category: 'Hoodies', is_recommended: true, quantity: 5 },
  { title: 'Women Printed Ethnic Dress', product_description: 'Women puffers to cleco store', price: 2199, old_price: 2499, exclusive_price: 1980, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
  { title: 'Women Bandhani Ethnic Dress', product_description: 'Women puffers to cleco store', price: 2199, old_price: 2499, exclusive_price: 1980, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
  { title: 'Women Printed Ethnic Dress', product_description: 'Women puffers to cleco store', price: 2299, old_price: 2599, exclusive_price: 2080, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
  { title: 'Women Embroidered Ethnic Dress ', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
  { title: 'Pack of 2 Women Printed Ethnic Dress ', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'suits', is_recommended: true, quantity: 5 },
  { title: 'Self Design Kanjivaram Cotton Silk Saree', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
  { title: 'Embroidered Bollywood Georgette Saree', product_description: 'Women puffers to cleco store', price: 2399, old_price: 2699, exclusive_price: 2180, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
  { title: 'Printed, Striped, Embellished Bandhani Georgette Saree ', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
  { title: 'Printed Daily Wear Chiffon Saree', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
  { title: 'Woven Kanjivaram Pure Silk Saree', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
  { title: 'Printed, Embellished Daily Wear Chiffon Saree ', product_description: 'women puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'women', is_published: true, sub_category: 'saree', is_recommended: true, quantity: 5 },
  { title: 'Kids Blazer Baby', product_description: 'Kids puffers to cleco store', price: 500, old_price: 700, exclusive_price: 400, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'blazzer', is_recommended: true, quantity: 5 },
  { title: 'kids hooded zipper jacket', product_description: 'Kids puffers to cleco store', price: 999, old_price: 1499, exclusive_price: 1236, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'jacket', is_recommended: true, quantity: 5 },
  { title: 'kids warm padded washable parka', product_description: 'Kids puffers to cleco store', price: 2499, old_price: 2799, exclusive_price: 2280, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'jacket', is_recommended: true, quantity: 5 },
  { title: 'kids Solid Tuxedo Style Festive & Wedding Blazer', product_description: 'Kids puffers to cleco store', price: 999, old_price: 1499, exclusive_price: 1236, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'blazzer', is_recommended: true, quantity: 5 },
  { title: 'boys hooded zipper jacket', product_description: 'Kids puffers to cleco store', price: 999, old_price: 1499, exclusive_price: 1236, product_details: 'very good product', category: 'kids', is_published: true, sub_category: 'jacket', is_recommended: true, quantity: 5 }
]

puts 'saving products'
products.each do |product|
  puts "title: #{product[:title]}"
  category = Category.find_by(name: product[:category])
  sub_category = SubCategory.find_by(name: product[:sub_category])
  prod = Product.find_or_create_by(title: product[:title], product_description: product[:product_description], price: product[:price], old_price: product[:old_price], exclusive_price: product[:exclusive_price], product_details: product[:product_details], category_id: category.id, is_published: product[:is_published], sub_category_id: sub_category.id, is_recommended: product[:is_recommended], quantity: product[:quantity])
  prod.image.attach(io: File.open("#{Rails.root.to_path}/public/default_product.jpg"), filename: 'ethnicwear.jpg')
end
puts 'products saved'
puts ''




# categories = ['mens', 'women', 'kids']

# puts 'Saving Categories'
# categories.each do |category|
#   debugger
#   puts "Category: #{category}"
#   category = Category.find_or_create_by(name: category)
#   category.logo.attach(io: File.open("#{Rails.root.to_path}/public/#{category}_category.jpg"), filename: 'ethnicwear.jpg')
# end
# puts 'Categories Saved'
# puts ''

# product.logo.attach(io: File.open("#{Rails.root.to_path}/public/#{product[:title]}_product.jpg"), filename: 'ethnicwear.jpg')
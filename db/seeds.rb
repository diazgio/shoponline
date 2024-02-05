# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.destroy_all
Category.destroy_all

categories = ['Electrónicos', 'Ropa', 'Hogar', 'Juguetes', 'Deportes', 'Libros', 'Salud', 'Belleza', 'Automotriz', 'Mascotas']

categories.each do |category_name|
  Category.create(name: category_name)
end

120.times do
  product = Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    stock: Faker::Number.between(from: 1, to: 100),
    category: Category.all.sample
  )
  
  product.photo.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'product_image.jpg')

  puts "Producto creado: #{product.title}"
end
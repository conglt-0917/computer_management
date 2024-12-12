
require 'faker'

100.times do
    Computer.create(
      name: Faker::Device.model_name, # Tên ngẫu nhiên của thiết bị
      brand: Faker::Device.manufacturer, # Hãng sản xuất
      price: Faker::Commerce.price(range: 500.0..5000.0), # Giá từ 500 đến 5000
      description: Faker::Lorem.sentence(word_count: 10) # Mô tả ngẫu nhiên
    )
end

puts "Seeded 100 computers successfully!"
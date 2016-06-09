require "faker"

10.times do
  List.create!(
    name: Faker::Company.buzzword,
    shared_with: Faker::Internet.email,
    user_id: 3
  )
end

50.times do
  Item.create!(
    name: Faker::Company.bs,
    list_id: Faker::Number.between(1, 10),
    delegated_to: Faker::Internet.email,
    user_id: 3
  )
end

puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Item.count} items created"

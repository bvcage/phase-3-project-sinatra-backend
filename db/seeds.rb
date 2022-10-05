puts "🌱 Seeding movies..."

require_relative "keys.rb"
OMDb_URL = "http://www.omdbapi.com/?apikey=#{OMDb_API_KEY}"
IMDb_ID_LIST = [
   "tt0213149",   # Pearl Harbor
   "tt2948356",   # Zootopia
   "tt1790864",   # Maze Runner
   "tt3104988",   # Crazy Rich Asians
   "tt3846674",   # To All the Boys I've Loved Before
   "tt6710474",   # Everything Everywhere All at Once
   "tt0120812",   # Rush Hour
   "tt0096061",   # Scrooged
   "tt1046997",   # Miracle at St Anna
   "tt1745960",   # Top Gun Maverick
   "tt2463208",   # The Adam Project
   "tt0477348",   # No Country for Old Men
   "tt7784604",   # Hereditary
   "tt0109445",   # Clerks
   "tt2911666",   # John Wick
   "tt0081505",   # The Shining
   "tt1375670",   # Grown Ups
   "tt2788710",   # The Interview
   "tt0099785",   # Home Alone
   "tt0109686",   # Dumb and Dumber
   "tt0092312",   # 21 Jump Street
]

IMDb_ID_LIST.each do |imdb_id|
   api = JSON.parse(RestClient.get "#{OMDb_URL}&i=#{imdb_id}")
   Movie.find_or_create_by(imdb_id: imdb_id) do |movie|
      movie.title = api["Title"]
      movie.genre = api["Genre"]
      movie.year = api["Year"]
      movie.plot = api["Plot"]
      movie.image_url = api["Poster"]
   end
end

puts "🌱 Seeding customers..."

CUSTOMERS = [
   {first_name: "Bailey", last_name: "Cage"},
   {first_name: "Ben", last_name: "Erkhart"},
   {first_name: "Dylan", last_name: "Carver"},
   {first_name: "William", last_name: "Jordan"},
]
CUSTOMERS.each do |customer|
   Customer.create_or_find_by(first_name: customer[:first_name], last_name: customer[:last_name]) do |customer|
      customer.phone_number = Faker::PhoneNumber.cell_phone
      customer.email = Faker::Internet.email(name: "#{customer[:first_name]}")
      customer.join_date = Faker::Date.between(from: '2018-01-01', to: Date.today)
   end
end

puts "🌱 Seeding rentals..."

10.times do
   Rental.create({
      checkout_date: Faker::Date.backward(days: 14),
      due_date: Faker::Date.forward(days: 7),
      price: rand(10..20),
      movie_id: rand(1..IMDb_ID_LIST.length),
      customer_id: rand(1..CUSTOMERS.length)
   })
end

puts "✅ Done seeding!"

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
]

IMDb_ID_LIST.each do |imdb_id|
   api = JSON.parse(RestClient.get "#{OMDb_URL}&i=#{imdb_id}")
   Movie.find_or_create_by(imdb_id: imdb_id) do |movie|
      movie.title = api["Title"]
      movie.year = api["Year"]
      movie.plot = api["Plot"]
      movie.image_url = api["Poster"]
   end
end

puts "✅ Done seeding!"

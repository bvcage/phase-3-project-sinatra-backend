class MoviesController < ApplicationController

   # returns all movies
   get "/movies" do
      movies = Movie.all
      # iterate thru optional query parameters
      if params.length > 0
         params.each do |var, val|
            movies = movies.search(var, val)
         end
      end
      # return
      { data: movies, status: 200 }.to_json
   end
  
   # returns 1 movie
   get "/movies/:id" do
      id = params[:id]
      movie = Movie.find(id)
      { data: movie, status: 200 }.to_json
   end

end
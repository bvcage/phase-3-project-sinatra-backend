class MoviesController < ApplicationController

   # returns all movies
   get "/movies" do
      movies = Movie.all
      { data: movies, status: 200 }
   end
  
   # returns 1 movie
   get "/movies/:id" do
      id = params[:id]
      movie = Movie.find(id)
      { data: movie, status: 200 }
   end

end
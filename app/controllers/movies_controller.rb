class MoviesController < ApplicationController

   # returns all movies
   get "/movies" do
      Movie.all.to_json
   end
  
   # returns 1 movie
   get "/movies/:id" do
      id = params[:id]
      Movie.find(id).to_json
   end

end
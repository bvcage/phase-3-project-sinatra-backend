class ReviewsController < ApplicationController

   # return all reviews
   get "/reviews" do
      reviews = Review.all
      # filter based on optional parameters
      if params.length > 0
         params.each do |var, val|
            if var == "movie_id" then
               reviews = reviews.search(var, val, true)
            else
               reviews = reviews.search(var, val)
            end
         end
      end
      # join desired info
      reviews = reviews.map do |review|
         {
            id: review.id,
            stars: review.stars,
            comment: review.comment,
            movie: {
               id: review.movie.id,
               title: review.movie.title,
               year: review.movie.year
            },
            customer: {
               id: review.customer.id,
               full_name: review.customer.full_name
            }
         }
      end
      # return
      { data: reviews, status: 200 }.to_json
   end

   # create new review without data
   get "/reviews/new" do
      review = Review.create()
      { data: review, status: 201 }.to_json
   end

   # update review
   patch "/reviews/:id" do
      id = params[:id]
      review = Review.find(id)
      edits = JSON.parse(request.body.read)
      review.update(edits)
      { data: review, status: 200 }.to_json
   end
end
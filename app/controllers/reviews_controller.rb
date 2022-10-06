class ReviewsController < ApplicationController

   # return all reviews
   get "/reviews" do
      reviews = Review.all
      # filter based on optional parameters
      if params.length > 0
         params.each do |var, val|
            reviews = reviews.search(var, val)
         end
      end
      # join desired info
      reviews = reviews.map do |review|
         puts review.customer
         {
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

end
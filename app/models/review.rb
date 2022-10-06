class Review < ActiveRecord::Base
   belongs_to :movie
   belongs_to :customer
   belongs_to :rental

end
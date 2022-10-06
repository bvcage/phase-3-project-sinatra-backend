class Review < ActiveRecord::Base
   extend Searchable

   belongs_to :movie
   belongs_to :customer
   belongs_to :rental

end
class Movie < ActiveRecord::Base
    has_many :rentals
    has_many :customers, through: :rentals
end
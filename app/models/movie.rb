class Movie < ActiveRecord::Base
    belongs_to :genre
    has_many :rentals
    has_many :customers, through: :rentals
end
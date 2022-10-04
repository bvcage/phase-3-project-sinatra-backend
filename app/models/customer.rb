require_relative "../modules/searchable.rb"

class Customer < ActiveRecord::Base
    extend Searchable

    has_many :rentals
    has_many :movies, through: :rentals

end
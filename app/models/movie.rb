require_relative "../modules/searchable.rb"

class Movie < ActiveRecord::Base
    extend Searchable

    has_many :rentals
    has_many :customers, through: :rentals

end
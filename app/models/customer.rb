require_relative "../modules/searchable.rb"

class Customer < ActiveRecord::Base
    extend Searchable

    has_many :rentals
    has_many :reviews
    has_many :movies, through: :rentals
    has_many :movies, through: :reviews

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
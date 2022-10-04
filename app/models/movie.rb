require_relative "../modules/searchable.rb"

class Movie < ActiveRecord::Base
    extend Searchable

    has_many :rentals
    has_many :customers, through: :rentals

    def self.list_genres
        genre_list = Movie.all.pluck(:genre).uniq
        genre_list = genre_list.map do |entry|
            entry.split(",").map do |item|
                item.strip
            end
        end
        genre_list.flatten.uniq.sort
    end

end
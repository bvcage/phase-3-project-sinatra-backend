class Movie < ActiveRecord::Base
    has_many :rentals
    has_many :customers, through: :rentals

    def self.search (data, value)
        where("#{data} LIKE ?", "%#{value}%")
    end
end
class Customer < ActiveRecord::Base
    has_many :rentals
    has_many :movies, through: :rentals

    def self.search (data, value)
        where("#{data} LIKE ?", "%#{value}%")
    end
end
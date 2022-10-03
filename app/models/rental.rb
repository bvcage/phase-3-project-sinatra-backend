class Rental < ActiveRecord::Base
    belongs_to :customer
    belongs_to :movie

    def self.search (data, value)
        where("#{data} LIKE ?", "%#{value}%")
    end
end
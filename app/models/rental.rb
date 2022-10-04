require_relative "../modules/searchable.rb"

class Rental < ActiveRecord::Base
    extend Searchable

    belongs_to :customer
    belongs_to :movie

end
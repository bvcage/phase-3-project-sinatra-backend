class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.datetime :checkout_date
      t.datetime :due_date
      t.integer :price
      
      t.integer :movie_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
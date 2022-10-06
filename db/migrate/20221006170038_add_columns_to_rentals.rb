class AddColumnsToRentals < ActiveRecord::Migration[6.1]
  def change
    add_column :rentals, :review_id, :integer
    add_column :rentals, :checkin_date, :datetime
  end
end

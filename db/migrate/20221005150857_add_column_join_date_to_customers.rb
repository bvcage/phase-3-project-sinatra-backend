class AddColumnJoinDateToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :join_date, :datetime
  end
end

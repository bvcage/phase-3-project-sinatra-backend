class ChangeMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :inventory, :integer
  end
end

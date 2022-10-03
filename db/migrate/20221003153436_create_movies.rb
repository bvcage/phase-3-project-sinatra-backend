class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :plot
      t.string :image_url
      t.string :imdb_id
    end
  end
end

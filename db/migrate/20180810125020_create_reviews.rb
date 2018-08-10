class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.references :cocktail, foreign_key: true
    end
  end
end

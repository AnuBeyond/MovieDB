class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating_value

      t.timestamps
    end
  end
end

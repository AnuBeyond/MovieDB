class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.json :crop_settings

      t.timestamps
    end
  end
end

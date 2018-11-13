class CreateHaspins < ActiveRecord::Migration[5.2]
  def change
    create_table :haspins do |t|
      t.references :user, foreign_key: true
      t.references :pin, foreign_key: true

      t.timestamps
    end
  end
end

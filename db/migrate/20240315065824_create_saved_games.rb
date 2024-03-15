class CreateSavedGames < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_games do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end

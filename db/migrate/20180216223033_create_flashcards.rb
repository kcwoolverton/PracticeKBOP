class CreateFlashcards < ActiveRecord::Migration[5.1]
  def change
    create_table :flashcards do |t|
      t.text :info
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFlashcards < ActiveRecord::Migration[5.1]
  def change
    create_table :flashcards do |t|
      t.attachment :photo
      t.text :info

      t.timestamps
    end
  end
end

class Student < ApplicationRecord
    belongs_to :class
    has_one :flashcard, dependent: :destroy
end

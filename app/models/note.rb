class Note < ApplicationRecord
  belongs_to :nurse, foreign_key: true
  belongs_to :patient, foreign_key: true

  validates :note, presence: true, length: { minimum: 6 }
end

class Note < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  validates :note, presence: true, length: { minimum: 6 }
end

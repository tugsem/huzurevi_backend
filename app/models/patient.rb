class Patient < ApplicationRecord
  belongs_to :nurse, foreign_key: 'assigned_nurse_id', optional: true
  has_many :medication_records

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :contact_number, presence: true
  validates :email, allow_nil: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true

end

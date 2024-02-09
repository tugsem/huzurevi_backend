class Nurse < ApplicationRecord
  has_secure_password
  has_many :patients, :medication_records

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, inclusion: { in: %w(Male Female Non-binary) }
  validates :contact_number, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end

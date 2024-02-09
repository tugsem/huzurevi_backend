class MedicationRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :nurse

  validates :medication_name, presence: true
  validates :dosage, presence: true
  validates :administration_time, presence: true
  validates :patient_id, presence: true
  validates :nurse_id, presence: true
end

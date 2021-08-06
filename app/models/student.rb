class Student < ApplicationRecord
  has_many :curriculums, dependent: :destroy
  has_many :target_scores, dependent: :destroy
  validates :name, presence: true
end

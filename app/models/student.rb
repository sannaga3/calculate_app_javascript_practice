class Student < ApplicationRecord
  has_many :curriculums, dependent: :destroy
  validates :name, presence: true
end

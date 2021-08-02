class Student < ApplicationRecord
  has_many :curriculums, dependent: :destroy
end

class Curriculum < ApplicationRecord
  belongs_to :student
  enum grades: { A:1, B:2, C:3, D:4}
end

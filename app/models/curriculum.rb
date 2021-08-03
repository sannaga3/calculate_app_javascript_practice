class Curriculum < ApplicationRecord
  belongs_to :student
  has_many :double_checks, dependent: :destroy
  accepts_nested_attributes_for :double_checks, allow_destroy: true, reject_if: :all_blank
  enum grades: { A:1, B:2, C:3, D:4}
end

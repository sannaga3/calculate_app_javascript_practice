class Curriculum < ApplicationRecord
  belongs_to :student
  has_many :double_checks, dependent: :destroy
  accepts_nested_attributes_for :double_checks, allow_destroy: true, reject_if: :all_blank

  with_options presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }  do
    validates :math
    validates :english
    validates :science
  end

  enum grades: { A:1, B:2, C:3, D:4}
end

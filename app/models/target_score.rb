class TargetScore < ApplicationRecord
  belongs_to :student
  with_options presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }  do
    validates :math
    validates :english
    validates :science
  end
end

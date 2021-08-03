class DoubleCheck < ApplicationRecord
  belongs_to :curriculum
  enum check: { yes:0, no:1 }
end

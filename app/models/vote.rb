class Vote < ApplicationRecord
  validates :name, presence: true
  validates :party, presence: true
  validates :age, presence: true
end

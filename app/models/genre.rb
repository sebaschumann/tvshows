class Genre < ApplicationRecord
  has_many :novelas

  validates :name, :presence => true, :uniqueness => true
end

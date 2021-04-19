class Novela < ApplicationRecord
  belongs_to :genre
  has_many :seasons

  validates :name, :presence => true, :uniqueness => true
end

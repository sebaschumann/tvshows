class Season < ApplicationRecord
  belongs_to :novela
  has_many :episodes

  validates :number, :presence => true
end

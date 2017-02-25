class Mortuary < ApplicationRecord
  validates_presence_of :name, :city, :state

  belongs_to :user
  has_many :deceaseds
end

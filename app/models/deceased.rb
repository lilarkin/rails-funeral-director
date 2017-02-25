class Deceased < ApplicationRecord
  validates_presence_of :first_name, :last_name, :birthdate, :deathdate, :code

  belongs_to :mortuary
  has_one :funeral
end

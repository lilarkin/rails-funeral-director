class Deceased < ApplicationRecord
  validates_presence_of :first_name, :last_name, :birthdate, :deathdate, :cod

  belongs_to :mortuary
  has_one :funeral

  def full_name
    "#{first_name} #{last_name}"
  end
end

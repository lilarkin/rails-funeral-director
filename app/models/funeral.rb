class Funeral < ApplicationRecord
  validates_presence_of :location, :time, :date
  belongs_to :deceased
  
end

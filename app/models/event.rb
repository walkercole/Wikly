class Event < ApplicationRecord
	
	belongs_to :user

	validates_numericality_of :urgency, :in => 1..5

end
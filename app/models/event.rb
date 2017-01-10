class Event < ApplicationRecord
	
	belongs_to :user

	validates_numericality_of :urgency, :in => 1..5
	validates_presence_of :title
	validates_numericality_of :day, :in => 1..7
end
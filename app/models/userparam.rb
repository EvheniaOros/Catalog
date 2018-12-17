class Userparam < ApplicationRecord
	belongs_to :user
	validates :firstname, :lastname, :age, presence: true
	validates :age, numericality: { only_integer: true }
end

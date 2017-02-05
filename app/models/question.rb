class Question < ApplicationRecord
	validates :title, presence: :true
	validates :spec, presence: :true
	validates :answer, presence: :true
	validates :rewardpoint, presence: :true
	validates :punishpoint, presence: :true
end

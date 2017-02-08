class Question < ApplicationRecord
	validates :title, presence: :true
	validates :spec, presence: :true
	validates :answer, presence: :true
	validates :rewardpoint, presence: :true
	validates :punishpoint, presence: :true

	has_many :submissions, dependent: :destroy
	has_many :judges, dependent: :destroy
	has_many :options, dependent: :destroy
	belongs_to :category, foreign_key: :category_id

	def correct?(solution)
		solution == answer
	end
end

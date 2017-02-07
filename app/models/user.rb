class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      
  has_many :submissions, dependent: :destroy
  has_many :judges, dependent: :destroy

  def give_reward(reward)
  	self.score += reward
  	if self.score < 0
  		self.score = 0
  	end
  	self.save
  end
  def give_punish(punish)
    @answerby = Judge.find_by_id(self.id)
  	self.score += punish
  	if self.score < 0
  		self.score = 0
  	end
  	self.save
  end
  def score_to_zero
  	self.score = 0
  end


end

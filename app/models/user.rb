class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook]

  has_many :submissions, dependent: :destroy
  has_many :judges, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

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

  def count_rank
    users = User.order(:score => :desc, :name => :asc)
    users.each_with_index do |u, i|
      if u.name == self.name or u.email == self.email
        return (i+1)
      end
    end
  end
end

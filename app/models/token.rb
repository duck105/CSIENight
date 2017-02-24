class Token < ApplicationRecord
  has_many :judge_tokens, dependent: :destroy
end

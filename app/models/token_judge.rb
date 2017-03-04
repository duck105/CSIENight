class TokenJudge < ApplicationRecord
  belongs_to :token, foreign_key: :token_id
  belongs_to :user, foreign_key: :user_id
end

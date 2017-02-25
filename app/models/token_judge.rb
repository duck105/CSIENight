class TokenJudge < ApplicationRecord
  belongs_to :token, foreign_key: :token_id
end

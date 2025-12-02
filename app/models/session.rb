class Session < ApplicationRecord
  belongs_to :playlist
  has_many :questions
  has_many :user_sessions
end

class Group < ApplicationRecord
  has_many :user_sessions
  has_many :questions
end

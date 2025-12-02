class Question < ApplicationRecord
  belongs_to :session
  belongs_to :song
  belongs_to :group
end

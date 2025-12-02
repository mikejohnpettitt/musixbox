class UserSession < ApplicationRecord
  belongs_to :user
  belongs_to :session
  belongs_to :group
end

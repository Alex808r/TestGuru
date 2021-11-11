class Feedback < ApplicationRecord
  validates :user_name, :email, :header, :content, presence: true
end

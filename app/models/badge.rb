# frozen_string_literal: true

# == Schema Information
#
# Table name: badges
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  parameter  :string           not null
#  rule       :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Badge < ApplicationRecord

  enum rules: {
    first_test_passed: 'first_test_passed',
    pass_test_by_level: 'pass_test_by_level',
    pass_test_by_category: 'pass_test_by_category'
    }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :image_url, :rule, :parameter, presence: true

  def formatted_created_at
    created_at.strftime('%d-%m-%y %H:%M:%S')
  end
end

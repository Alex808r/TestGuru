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
require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

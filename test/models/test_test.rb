# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id           :bigint           not null, primary key
#  level        :integer          default(0), not null
#  passing_time :integer
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer          not null
#  category_id  :integer          not null
#
# Indexes
#
#  index_tests_on_author_id        (author_id)
#  index_tests_on_category_id      (category_id)
#  index_tests_on_title_and_level  (title,level) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#
require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

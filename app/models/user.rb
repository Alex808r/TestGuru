# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy, inverse_of: :author

  before_save :before_save_email_downcase

  def show_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end


  private

    def before_save_email_downcase
      self.email = email.downcase if email.present?
      # email.downcase! if email.present?
    end
end

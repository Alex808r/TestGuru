# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy, inverse_of: :author

  before_save :before_save_email_downcase

  validates :name,  presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, if: Proc.new {|user| user.password_digest.blank?}
  validates :password, confirmation: true

  def show_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  # Автотизация без has_secure_password
  attr_reader :password
  attr_writer :password_confirmation

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end


  private

    def before_save_email_downcase
      self.email = email.downcase if email.present?
      # email.downcase! if email.present?
    end
end

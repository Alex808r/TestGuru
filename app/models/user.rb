# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy, inverse_of: :author
  has_many :gists, dependent: :destroy

  before_save :before_save_email_downcase

  # validates :name,  presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def show_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

  private

  def before_save_email_downcase
    self.email = email.downcase if email.present?
    # email.downcase! if email.present?
  end
end

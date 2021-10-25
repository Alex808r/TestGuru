module User::Auth
  extend ActiveSupport::Concern # для доступа к методам validates

  # Автотизация без has_secure_password
  attr_reader :password
  attr_writer :password_confirmation

  # подключаем методы validates в модуль
  included do
    validates :name,  presence: true, length: { minimum: 3, maximum: 50 }
    validates :email, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, if: Proc.new {|user| user.password_digest.blank?}
    validates :password, confirmation: true

  end


  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
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

    def digest(string)
      Digest::SHA1.hexdigest(string)
    end
end

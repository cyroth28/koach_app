module HasPassword
  extend ActiveSupport::Concern

  included do
    attr_reader :password
    validates :password, length: { minimum: 6, allow_nil: true}
  end

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  module ClassMethods
    def find_by_credentials(email, password)
      person = self.find_by(email: email)
      return nil unless person
      person.password_digest.is_password?(password) ? person : nil
    end
  end
end

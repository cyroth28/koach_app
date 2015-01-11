module HasSession
  extend ActiveSupport::Concern

  included do
    validates :session_token, presence: true

    after_initialize :ensure_session_token
  end

  def ensure_session_token
    self.session_token = self.class.generate_token
  end

  def reset_session_token

  end

  module ClassMethods
    def generate_token
      SecureRandom.urlsafe_base64
    end
  end
end

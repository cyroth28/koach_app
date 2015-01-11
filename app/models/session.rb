class Session < ActiveRecord::Base

  validates :token, :sessionable_id, :sessionable_type, presence: true

  after_initialize :ensure_token

  def ensure_token
    self.token ||= self.class.generate_token
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end
end

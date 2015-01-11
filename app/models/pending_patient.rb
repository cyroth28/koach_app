class PendingPatient < ActiveRecord::Base
  validates :name, :email, :verification_token, presence: true
  validates :email, uniqueness: true
  after_initialize :ensure_verification_token

  belongs_to(:pt)

  def ensure_verification_token
    self.verification_token = SecureRandom.urlsafe_base64
  end
end

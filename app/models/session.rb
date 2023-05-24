class Session < ApplicationRecord
    validates :user_id, presence: true
    before_validation :generate_session_token
    belongs_to :user

    def generate_session_token
        self.token = SecureRandom.urlsafe_base64
    end
end

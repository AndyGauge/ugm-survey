class Login < ActiveRecord::Base
  validates :user, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def self.attempt (user,pass)
    if (login = self.find_by_user(user))
      return login if login.password_digest == pass
    end
    return false
  end
end

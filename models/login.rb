class Login < ActiveRecord::Base
  def self.attempt (user,pass)
    if (login = self.find_by_user(user)) && login.count
      return login if login.password_digest == pass
    end
    return false
  end
end

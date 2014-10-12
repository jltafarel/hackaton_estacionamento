class Motorista < ActiveRecord::Base

  scope :com_user, ->(user) {
    find_by user: user
  }
  scope :login_valido?, ->(user, password) {
    m = com_user(user)
    if m.password.eql? password
      return true
    end
  }
end

class User < ActiveRecord::Base
	has_one :cart
  has_secure_password
end

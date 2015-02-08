 require 'resolv'
class User < ActiveRecord::Base
	has_one :cart
	validates :name, presence: true
  has_secure_password
  has_many :orders
  # validate :valid_email?

  def valid_email?
    begin
      domain_name = TMail::Address.parse(email).domain
      domain_valid?(domain_name)
    rescue
      errors.add(:email, "has an invalid format.")
    end
  end



  def domain_valid?(domain)
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain.to_s, Resolv::DNS::Resource::IN::MX)
    end
    if @mx.empty?
      errors_add(:email, 'domain name can not be found.')
    end
  end
end

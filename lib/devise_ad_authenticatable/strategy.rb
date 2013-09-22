require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class AdAuthenticatable < Authenticatable
      def authenticate!
        resource = valid_password? && mapping.to.authenticate_with_ad(authentication_hash.merge(password: password))
        if resource && validate(resource)
          success! resource
        else
          fail :invalid
        end
      end
    end
  end
end

Warden::Strategies.add(:ad_authenticatable, Devise::Strategies::AdAuthenticatable)

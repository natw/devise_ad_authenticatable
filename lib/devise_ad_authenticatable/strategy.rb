require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class AdAuthenticatable < Authenticatable
      def authenticate!
        Rails.logger.debug 'HEY!, AUTHENTICATE!'
        resource = valid_password? && mapping.to.authenticate_with_ad(authentication_hash.merge(password: password))
        if validate(resource)
          success! resource
        end
      end
    end
  end
end

Warden::Strategies.add(:ad_authenticatable, Devise::Strategies::AdAuthenticatable)

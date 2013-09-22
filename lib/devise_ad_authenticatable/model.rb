require 'devise_ad_authenticatable/strategy'
require 'simple_ad_auth'

module Devise
  module Models
    module AdAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_reader :password
      end

      def password=(new_password)
        @password = new_password
      end

      module ClassMethods
        def authenticate_with_ad(attributes={})
          auth_key = self.authentication_keys.first
          auth_value = attributes[auth_key]
          password = attributes[:password]

          SimpleADAuth.configure do |config|
            config.host = ::Devise.ad_host
            config.port = ::Devise.ad_port
            config.domain = ::Devise.ad_domain
            config.search_root = ::Devise.ad_search_root
          end
          if SimpleADAuth.authenticate(auth_value, password)
            return find_or_create_by(auth_key => auth_value)
          else
            return nil
          end
        end
      end
    end
  end
end

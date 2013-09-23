require 'devise_ad_authenticatable/strategy'
require 'simple_ad_auth'

module Devise
  module Models
    module AdAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_reader :password
        attr_accessor :ad_groups
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
          ad_user = SimpleADAuth.authenticate(auth_value, password)
          required_groups = ::Devise.ad_required_groups
          if ad_user && (required_groups.empty? || !(required_groups & ad_user.groups).empty?)
            resource = find_or_create_by(auth_key => auth_value)
            resource.ad_groups = ad_user.groups
            return resource
          else
            return nil
          end
        end
      end
    end
  end
end

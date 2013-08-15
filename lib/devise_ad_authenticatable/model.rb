require 'devise_ad_authenticatable/strategy'

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

          resource = where(auth_key => auth_value).first
          return resource

          if resource.try(:valid_ad_authentication?, attributes[:password])
            return resource
          end
        end
      end
    end
  end
end

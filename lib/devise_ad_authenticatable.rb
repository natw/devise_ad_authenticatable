require 'devise'

require 'devise_ad_authenticatable/strategy'
require 'devise_ad_authenticatable/model'


module Devise
  [:ad_host, :ad_port, :ad_search_root, :ad_domain].map(&:to_s).each do |attr|
    class_eval %Q"
      def self.#{attr}
        @@#{attr}
      end
      def self.#{attr}=(a)
        @@#{attr} = a
      end
    "
  end
  @@ad_port = '389'
end

Devise.add_module(
  :ad_authenticatable,
  :route => :session,
  :strategy => true,
  :controller => :sessions,
  :model => 'devise_ad_authenticatable/model'
)

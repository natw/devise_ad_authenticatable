require 'devise'

require 'devise_ad_authenticatable/strategy'
require 'devise_ad_authenticatable/model'


module Devise
  @@ad_port = '389'
  @@ad_required_groups = []
  [:ad_host, :ad_port, :ad_search_root, :ad_domain, :ad_required_groups].map(&:to_s).each do |attr|
    class_eval %Q"
      def self.#{attr}
        @@#{attr}
      end
      def self.#{attr}=(a)
        @@#{attr} = a
      end
    "
  end
end

Devise.add_module(
  :ad_authenticatable,
  :route => :session,
  :strategy => true,
  :controller => :sessions,
  :model => 'devise_ad_authenticatable/model'
)

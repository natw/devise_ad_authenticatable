require 'devise'

require 'devise_ad_authenticatable/strategy'
require 'devise_ad_authenticatable/model'


Devise.add_module(
  :ad_authenticatable,
  :route => :session,
  :strategy => true,
  :controller => :sessions,
  :model => 'devise_ad_authenticatable/model'
)

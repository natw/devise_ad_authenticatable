devise_ad_authenticatable
=========================

Devise module for authenticating against an ActiveDirectory server.

A lot of this is cribbed from [devise_ldap_authenticatable](https://github.com/cschiewek/devise_ldap_authenticatable).
I couldn't get that to work with AD, so it seemed easier to just try writing my own.
There's also [devise_active_directory_authenticatable](https://github.com/ajrkerr/devise_active_directory_authenticatable), which is actually a fork of the LDAP one, but it seems old and unmaintained.

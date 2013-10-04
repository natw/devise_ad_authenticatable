devise_ad_authenticatable
=========================

Devise module for authenticating against an ActiveDirectory server.

A lot of this is cribbed from [devise_ldap_authenticatable](https://github.com/cschiewek/devise_ldap_authenticatable).
I couldn't get that to work with AD, so it seemed easier to just try writing my own.
There's also [devise_active_directory_authenticatable](https://github.com/ajrkerr/devise_active_directory_authenticatable),
which is actually a fork of the LDAP one, but it seems old and unmaintained.


configuration
-------------

There are a couple options you can add to your devise config:

- **ad_host** - The host of your ActiveDirectory server
- **ad_port** - the port (defaults to 389)
- **ad_domain** - The search domain for AD queries
- **ad_search_root** - search root. Ask someone who actually knows anything about AD what that means.
- **ad_required_groups** - A list of groups that the user must belong to in order to be authenticated.

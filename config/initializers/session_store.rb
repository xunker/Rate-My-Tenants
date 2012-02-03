# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rate_my_tenants_session',
  :secret      => 'ddf1f5ef41b8ee3076db952733c22de2ccdde4fabd5ae810e3aae708708a264f0052ae7b4cad5e9a068d86c444e20e2493c1275494791c7b2e86874275695c1b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

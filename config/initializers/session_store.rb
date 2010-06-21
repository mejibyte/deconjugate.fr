# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_deconjugate_session',
  :secret      => '95a5391771a47b31d53f92850ce8dc4a821314c52330bd5ce89f3f4adf50829336be81b2e18395b8b633f2a0839a46c188f594c8e24c24473b8ebb2986c81234'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

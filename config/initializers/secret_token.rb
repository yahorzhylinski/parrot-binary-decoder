# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
ParrotDecoder::Application.config.secret_token = 'c40ca7c5ffbd169876c1b1681ba9d2e29bfd65bf2e14e03384b9597b5f32334f8e9e55dd58d7d68e1e8eb1d5eeb47969b67f5a900adfe0e8efcc22fa0a6d874a'

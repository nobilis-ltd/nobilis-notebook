ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Setup umniauth in test_mode with mock hash
  OmniAuth.config.test_mode = true
  omniauth_hash = OmniAuth::AuthHash.new({
    provider: 'google',
    uid: '1738',
    info: {
      name: 'Test Testington',
      email: 'likestotest.testinginc.com',
      nickname: 'MasterTester'
    },
    credentials: {
      token: 'token_for_testing',
      expires_at: DateTime.new() + 3600
    }
  })
  
  OmniAuth.config.add_mock(:google, omniauth_hash)
end

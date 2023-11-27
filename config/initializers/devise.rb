# config/initializers/devise.rb

Devise.setup do |config|
  # Use this hook to configure Devise. Add or uncomment settings as needed.

  # ==> Secret Key
  # Devise uses this key to generate random tokens. Changing it invalidates existing tokens.
  # config.secret_key = 'your-secret-key'

  # ==> Mailer Configuration
  # The email address shown in Devise::Mailer. You can change it for your application.
  config.mailer_sender = 'your-email@example.com'

  # ==> ORM Configuration
  # Load and configure the ORM (e.g., :active_record for ActiveRecord).
  require 'devise/orm/active_record'

  # ==> Authentication Keys
  # Configure keys used for user authentication.
  config.authentication_keys = [:email] # Change this to an array if you use other keys.

  # ==> Case Insensitive Keys
  # Keys that should be treated as case-insensitive during authentication.
  config.case_insensitive_keys = [:email] # You can add other keys if necessary.

  # ==> Strip Whitespace Keys
  # Keys that should have whitespace stripped before authentication.
  config.strip_whitespace_keys = [:email] # You can add other keys if necessary.

  # ==> Reconfirmable
  # Require email reconfirmation when an email is changed.
  config.reconfirmable = true

  # ==> Rememberable
  # How long the user will be remembered without needing to log in again (default: 2 weeks).
  config.remember_for = 2.weeks

  # ==> Validatable
  # Define the range for password length and email format validation regex.
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Timeoutable
  # The time after which a user session times out due to inactivity (default: 30 minutes).
  config.timeout_in = 30.minutes

  # ==> Lockable
  # Account lock settings (if you want to use account lock feature).
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour

  # ==> Recoverable
  # The time interval for resetting a password with a reset password key.
  config.reset_password_within = 6.hours

  # ==> OmniAuth
  # If you want to integrate with OmniAuth providers, you can add them here.

  # ==> Hotwire/Turbo Configuration
  # This configures the HTTP status codes to match Hotwire/Turbo behavior.

  # ==> Registerable (Optional)
  # Configuration for user registration, whether to sign in automatically after changing a password.
  # config.sign_in_after_change_password = true

  # ==> API Authentication Configuration
  # Use token-based authentication for API
  config.skip_session_storage = [:http_auth]
  #config.navigational_formats = ['*/*', :json]
  config.navigational_formats = ['*/*', :html, :json]


  # ==> Token Authentication Keys (Add these lines)
  config.authentication_keys = [:email]  # or other keys as needed
  config.strip_whitespace_keys = [:email]  # or other keys as needed

  # ==> Token Expire Time (optional)
  # If you want to configure token expiration, you can add this line:
  # config.expire_auth_token_on_timeout = true
  # This will make tokens expire after the `timeout_in` duration.

  # ==> Email Sending Configuration (optional)
  # You can configure the sender email for Devise here:
  # config.mailer_sender = 'your-email@example.com'

  # ==> Password Complexity Configuration (optional)
  # Define the range for password length and email format validation regex:
  # config.password_length = 6..128
  # config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
end

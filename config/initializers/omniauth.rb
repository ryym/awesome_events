Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    Rails.application.secrets.twitter_api_key,
    Rails.application.secrets.twitter_api_secret
end

OmniAuth.config.on_failure = -> (env) {
  Rack::Response.new(
    ['302 Moved'], 302, 'Location' => env['omniauth.origin'] || "/"
  ).finish
}

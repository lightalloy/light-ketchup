require './config/environment'
require './lib/middlewares/github_auth'

require 'omniauth'

use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']

use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user,repo,gist', provider_ignores_state: true
end

use GithubAuth

run Hanami.app

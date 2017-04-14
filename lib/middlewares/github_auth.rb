require 'roda'

class GithubAuth < Roda
  use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']

  plugin :middleware

  route do |r|
    r.is 'auth/failure' do
      # logging errors
    end

    r.is 'auth/logout' do
      session[:user_id] = nil
      r.redirect '/'
    end

    r.on 'auth/:provider' do
      r.is 'callback' do
        raw_info = request.env.fetch('omniauth.auth').fetch('extra').fetch('raw_info')
        raw_info.each do |k, v|
          puts "#{k}: #{v}"
        end

        repo = UserRepository.new
        # TODO: - manage situations when user is not found/created
        user = repo.for_github(raw_info)
        session[:user_id] = user.id if user
        r.redirect '/'
      end
    end
  end
end

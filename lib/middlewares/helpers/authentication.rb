module Authentication
  def self.included(action)
    action.class_eval do
      expose :current_user
    end
  end

  def authenticate
    # puts "authenticate - session #{session.keys}"
    current_user
  end

  private

  def authenticate!
    redirect_to('/') unless authenticated?
  end

  def authenticated?
    current_user.authenticated?
  end

  def current_user
    @current_user || set_current_user
  end

  def set_current_user
    @current_user = if session[:user_id]
                      UserRepository.new.find(session[:user_id])
                    else
                      GuestUser.new(session)
                    end
  end
end

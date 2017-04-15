module Authentication
  def self.included(action)
    action.class_eval do
      expose :current_user
    end
  end

  def authenticate
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
    @current_user ||= set_current_user
  end

  def set_current_user
     user = UserRepository.new.find(session[:user_id]) if session[:user_id]
     user ||= GuestUser.new(session)
  end
end

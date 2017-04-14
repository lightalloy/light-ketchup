class GuestUser
  def initialize(session = {})
    @session = session
  end

  def id
    ''
  end

  def login
    'Guest'
  end

  def authenticated?
    false
  end
end

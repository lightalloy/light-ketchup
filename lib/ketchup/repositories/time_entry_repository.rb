class TimeEntryRepository < Hanami::Repository

  def for_user(user_id)
    return [] if user_id.to_s.empty?
    time_entries.where(user_id: user_id)
  end

end

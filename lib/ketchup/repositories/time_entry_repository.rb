class TimeEntryRepository < Hanami::Repository

  def for_user(user_id)
    return [] if user_id.to_s.empty?
    time_entries.where(user_id: user_id)
  end

  def one_for_user_by_id(user_id, id)
    for_user(user_id).where(id: id).first
  end

  def for_user_by_date(user_id, date = Date.today)
    return [] if user_id.to_s.empty?
    for_user(user_id).where(date: date)
  end

  def user_sum_for_date(user_id, date = Date.today)
    return [] if user_id.to_s.empty?
    for_user_by_date(user_id, date).sum(:minutes).to_i
  end

  def user_dates_minutes(user_id)
    return [] if user_id.to_s.empty?
    hsh = {}
    for_user(user_id).map do |entry|
      date = entry.fetch(:date)
      minutes = entry.fetch(:minutes)
      hsh[date] ||= 0
      hsh[date] += minutes
    end
    hsh
    # select sum(minutes) from time_entries where user_id = 1 group by date
  end
end

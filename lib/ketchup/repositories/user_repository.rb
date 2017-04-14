class UserRepository < Hanami::Repository
  def for_github(raw_info = {})
    github_id = raw_info.fetch(:id)
    one_by_github_id(github_id) ||
      create(github_id: github_id, login: raw_info.fetch(:login), email: raw_info.fetch(:login))
  end

  def one_by_github_id(github_id)
    users.where(github_id: github_id.to_s).first
  end
end

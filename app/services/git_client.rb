class GitClient

  def initialize(access_token)
    @access_token = access_token
  end

  def fetch_user_repositories_name_and_id
    user_repositories.sort_by(& :full_name).map { |repo| [repo.full_name, repo.id] }
  end

  def repository_params(git_hub_repo_id)
    current_repo = user_repositories.filter { |repo| repo[:id] == git_hub_repo_id.to_i }.first
    puts current_repo[:language]
    {
      name: current_repo[:name],
      full_name: current_repo[:full_name],
      language: current_repo[:language],
      git_url: current_repo[:clone_url],
      ssh_url: current_repo[:ssh_url]
    }
  end

  private

  def client
    Octokit::Client.new(access_token: @access_token, auto_paginate: true)
  end

  def user_repositories
    client.repos
  end

end

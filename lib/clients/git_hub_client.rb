require 'dotenv/load'

class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  # ACCESS_TOKEN = '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'
  # ACCESS_TOKEN =

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN_GIT_HUB']}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end

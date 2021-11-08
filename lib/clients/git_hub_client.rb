# frozen_string_literal: true

require 'dotenv/load'

class GitHubClient
  attr_reader :http_client

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN_GIT_HUB'])
  end
end

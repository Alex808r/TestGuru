class TestsController < ApplicationController
  def index
    render plain: "All tests"
  end

  def start
    render plain: "Start certain test"
  end
end

class TestsController < ApplicationController

  before_action :set_test!, only: %i[show]
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    tests_titles = []
    @tests.each{|test| tests_titles.push(test.title)}
    render plain: tests_titles.join("\n")
  end

  def show
    render plain: @test.inspect
  end

  def new
  end

  def create
    test = Test.new(test_params)
    if test.save
      render plain: test.inspect
    else
      render plain: "The test was not created"
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters #{params.inspect}" ]
    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def set_test!
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execution time: #{finish * 1000}ms")
  end

end


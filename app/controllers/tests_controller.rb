class TestsController < ApplicationController

  before_action :find_test, only: %i[show]
  around_action :log_execute_time

  def index
    # byebug
    # result = ["Class: #{params.class}", "Parameters #{params.inspect}" ]
    # render plain: result.join("\n")
    @tests = Test.all
    render plain: @tests.inspect
  end

  def show
    redirect_to root_path
  end

  def new

  end

  def create
    test = Test.create(test_params)
    render plain: test.inspect

    # test = Test.create(params.require(:test).permit(:title, :level))
    # render plain: test.inspect

    # test = Test.create(params[:test])
    # render plain: test.inspect
    # # result = ["Class: #{params.class}", "Parameters #{params.inspect}" ]
    # render plain: result.join("\n")
  end

  def search
    result = ["Class: #{params.class}", "Parameters #{params.inspect}" ]
    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execution time: #{finish * 1000}ms")
  end

end


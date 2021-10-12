class TestsController < ApplicationController

  before_action :set_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.pluck(:id, :title).sort
    render plain: @tests
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


  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end

end


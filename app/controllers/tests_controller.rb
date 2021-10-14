class TestsController < ApplicationController

  before_action :set_test, only: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
    # @tests = Test.pluck(:id, :title).sort
      #render plain: @tests
  end

  def show

  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end

  end


  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end

end


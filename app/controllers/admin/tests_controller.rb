# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy update_inline]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.author_tests.new(test_params)
    if @test.save
      flash[:success] = t('.success')
      redirect_to admin_test_path(@test)
      # redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      flash[:success] = t('.update_success')
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :passing_time)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: :not_found, layout: false
  end
end

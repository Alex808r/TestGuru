class TestsController < ApplicationController

  def index
    # byebug
    result = ["Class: #{params.class}", "Parameters #{params.inspect}" ]
    render plain: result.join("\n")
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

end


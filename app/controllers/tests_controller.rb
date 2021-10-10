class TestsController < ApplicationController

  def index

    # render plain: "All tests"

    # render html: '<h1>All tests</h1>'.html_safe

    # render json: { tests: []}

    # render json: { tests: Test.all}

    # render inline: '<p> My favourite language is <%= %[ybuR].reverse! %> ! </p>'

    # render file: "public/hello.html", layout: false
    # render file: Rails.root.join('public/hello.html')
    # render file: "#{Rails.root}/public/hello.html", layout: false

    # head 204
    # head :no_content

    # byebug

    # render inline: '<%= console %>'
    #
    logger.info(self.object_id)
    #
    respond_to do |format|
      format.html {render plain: 'All tests'}
      format.json {render json: {tests: Test.all}}
    end
  end

    def show
      byebug

      redirect_to root_path

      # render plain: 'Show test'
      # redirect_to '/'
    end


  end


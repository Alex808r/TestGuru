class ApplicationController < ActionController::Base

  # создадим метод для отображения страницы about.html
  def hello
    #render file: "public/about.html"
    render file: "#{Rails.root}/public/about.html", layout: false
  end
end

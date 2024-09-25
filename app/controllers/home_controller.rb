class HomeController < ApplicationController
  def index
    @books = Book.order("RANDOM()").limit(3)
  end
end

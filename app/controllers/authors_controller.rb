class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:books).ordered_by_name
    
    if params[:active] == "true"
      @authors = @authors.active
    elsif params[:active] == "false"
      @authors = @authors.where(active: false)
    end
  end

  def show
    @author = Author.includes(:books).find(params[:id])
    @books = @author.books.order(year: :desc)
  end
end

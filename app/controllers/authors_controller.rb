class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])
  end

  def create 
    @author = Author.new(author_param)
    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end
  end
  def update
    @author = Author.find(params[:id])
    @author.update(author_param)
    redirect_to authors_path
  end
  def destroy
    @author = Author.find(params[:id])
    @author.destroy(author_param)
    redirect_to authors_path
  end
  private
  def author_param
    params.require(:author).permit(:first_name, :last_name, :title)
  end
end

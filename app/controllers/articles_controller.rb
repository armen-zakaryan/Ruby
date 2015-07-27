class ArticlesController < ApplicationController

  def index
    # We keep this in instance variable because Rails will pass all instance variables to the view.
    @article = Article.all
    tt = 90
  end

  def show
    # We keep this in instance variable because Rails will pass all instance variables to the view.
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new( article_params )

    @article.save
    redirect_to @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end

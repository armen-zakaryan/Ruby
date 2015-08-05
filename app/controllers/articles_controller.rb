class ArticlesController < ApplicationController
  @@counter = {
      'counter'=> 0,
      'counter_in_new' => 0
  }
  @@id=0

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    # We keep this in instance variable because Rails will pass all instance variables to the view.
    @articles = Article.all
  end

  def show
    # We keep this in instance variable because Rails will pass all instance variables to the view.
    @article = Article.find(params[:id])
  end

  def new
    #fake instance to avoid an error in html
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @@id = @article.object_id

    if @article.save
      redirect_to @article
    else
      render 'new'
      #redirect_to('/articles/new')
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end

class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      redirect_to @article, notice: "Article was successfully saved!"
      # format.html { redirect_to @article, notice: "Article created successfully" }
      # format.turbo_stream { render turbo_stream: turbo_stream.append("articles", @article) }
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article successfully updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end


  def edit

  end

  def show

  end


  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  def destroy
    @article.destroy

    flash[:danger] = "Successfully deleted..."
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id]) if params[:id]
    @article = Article.find(params[:article_id]) if params[:article_id]
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end



end

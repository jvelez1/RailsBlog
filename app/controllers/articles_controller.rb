class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update]
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
      flash[:notices] = "Article was created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

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

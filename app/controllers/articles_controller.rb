class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:employee).order('created_at DESC')
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to employee_articles_url, notice: '新しい記事が投稿されました。'
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destory; end

  private

  def article_params
    params.require(:article).permit(:title, :content).merge(employee_id: params[:employee_id])
  end
end

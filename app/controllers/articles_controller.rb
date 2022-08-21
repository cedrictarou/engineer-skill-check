class ArticlesController < ApplicationController
  before_action :set_employee, only: %i[new edit show update destroy]

  def index
    @page_title = '記事一覧ページ'
    @articles = Article.includes(:employee).order("#{sort_column} #{sort_direction}")
  end

  def show
    @page_title = '記事詳細ページ'
    @article = Article.find(params[:id])
  end

  def new
    @page_title = '新規記事投稿ページ'
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

  def edit
    @page_title = '記事編集ページ'
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to employee_articles_url(set_employee.id), notice: "記事「#{@article.title}」が更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    ActiveRecord::Base.transaction do
      now = Time.now
      @article.update_column(:deleted_at, now)
    end
    redirect_to employee_articles_path(params[:id]), notice: "「#{@article.title}」を削除しました。"
  end

  private

  def set_employee
    @employee = Employee.find(@current_user.id)
  end

  def article_params
    params.require(:article).permit(:title, :content).merge(employee_id: set_employee.id)
  end

  def sort_column
    params[:sort] || 'updated_at'
  end

  def sort_direction
    params[:direction] || 'desc'
  end
end

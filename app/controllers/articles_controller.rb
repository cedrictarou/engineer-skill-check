class ArticlesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @artcile = Article.new(article_params)

    if @article.save
      redirect_to action: :index, notice: "社員が記事を投稿しました。"
    else
      render :new, notice: "エラーがあります。"
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  private
    def article_params
      params.require(:article).permit(:title, :content).merge(author: current_user.id)
    end
end

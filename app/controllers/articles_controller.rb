class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_user.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'article was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to articles_path, notice: "Not authorized to edit this article" if @article.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:description, :image)
    end
end

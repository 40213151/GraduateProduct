class BlogsController < ApplicationController
  before_action :authenticate_farmer!, only: [:new, :create, :edit, :update]
  before_action :set_blog, only: [:show, :edit, :update]
  
  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    # 現在のユーザーのお仕事の作成
    @blog = current_farmer.blogs.build
  end

  def create
    # パラメーターとともに現在の農家のお仕事を作成
    @blog = current_farmer.blogs.build(blog_params)
    
    if @blog.save
      redirect_to farmer_path(@blog.farmer), notice: "お仕事を掲載しました"
    else
      redirect_to new_blog_path(@blog), notice: "失敗しました、やりなおしてください"
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path(@blog), notice: "お仕事を掲載しました"
    end
  end

  def delete
  end
  
  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_content, :bimage)
  end

  def set_blog
    @blog = Blog.find(params[:id]) 
  end
end

class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    render json: @blogs
  end

  def create


    @blog = @user.blogs.new(blog_params)
    if @blog.save
      render json: @user
    else
      render json: { error: 'Error creating blog.'}
    end
  end

  def show
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  def destroy
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    @blog.destroy
    render json: @user
  end

  private


  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

end

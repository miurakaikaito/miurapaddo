class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:edit, :show]

  def index
    @post = Post.includes(:user).order("created_at DESC")
    @post = Post.all.order("created_at DESC")
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render action: :new
    end
  end


  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end
  
  def search
    @posts = Post.search(params[:keyword])
  end


  def new
    @post = Post.new
    @post.menus.build
    @post.recipes.build
  end

  # def zairyou
  #   session[:name]= post_params[:name]
  #   session[:image]= post_params[:image]
  #   @post = Post.new
  # end

  # def recipe
  #   session[:text]= post_params[:text]
  #   @post = Post.new
  # end

  # def impressions
  #   session[:text2]= post_params[:text2]
  #   @post = Post.new
  # end

  # def create
  #   session[:text2]= post_params[:text2]
  #   Post.create(
  #     name: session[:name],
  #     image: session[:image],
  #     text: session[:text],
  #     text2: session[:text2],
  #   )
  # end

  private
  def post_params
    params.require(:post).permit(:name, :text, :image, :text2,:price,
    menus_attributes: [:menu, :id, :_destroy, :amount],
    recipes_attributes: [:recipe, :id, :_destroy, :image_url]
     ).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

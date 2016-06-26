class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json

  def main
     @posts =Post.order("created_at DESC")
  end

  def reports
    @user
    main
  end

  def index
    @q = params[:q]
    aux = @q.to_s
   # @c = params[:c]
    if @q#==nil
      #@posts = Post.where(:category => @q)
      @posts = Post.where("category LIKE '%#{aux}%'")
    
      #@posts = Post.where(:title => @q) #busca x por nombre
    else
      @posts = Post.where("content LIKE '%#{aux}%'").order("created_at DESC")
     #if @c
        #aux = @c.to_s
      #end
    end
   
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  def like_post
    @post = Post.find(params[:id])
    @post.like += 1
    @post.save
    redirect_to(:back)
    
  end


  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
     @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post creado exitosamente.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'El Post se a modificado exitosamente.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post=Post.find(params[:id])

    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'El Post se a eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content,:like,:category)
    end

  end

module Admin
class BlogsController < ApplicationController
  before_filter :find_blog,      :only => %w(show edit destroy)
  before_filter :find_category,  :only => [:create, :update]
  before_filter :authenticate_user!
  before_filter :configure_layout

  def index
    options = { :category_id => @category ? @category.id : nil, :per_page => 25, :all => true }
    @blogs  = Blog.paginate( options ).page( params[:page] )
    render
  end

  def new
    @blog = Blog.new
    render
  end

  def edit
    render
  end

  def create
    p = params[:blog]
    # DataMapper doesn't like multi-parameter attributes, so remove them and combine them
    p[:comments_expire_at] = DateTime.parse(
     [p.delete(:'comments_expire_at(1i)'), p.delete(:'comments_expire_at(2i)'), p.delete(:'comments_expire_at(3i)')].join('-')
    )

    @blog = Blog.new(p)
    @blog.category = @category
    @blog.user = current_user

    if @blog.save
      redirect_to blog_url(@blog)
    else
      puts @blog.inspect
      render :action => :new
    end
  end

  def update
    @blog = Blog.first(params[:id])
    raise NotFound unless @blog

    @blog.category = @category
    if @blog.update_attributes(params[:blog])
      flash[:notice] = 'Success!  Your blog has been updated.'
      sweep_cache
      redirect url(:admin_blogs, @blog)
    else
      raise BadRequest
    end
  end

  def destroy
    @blog = Blog.first(params[:id])
    raise NotFound unless @blog
    if @blog.destroy!
      redirect url(:blogs)
    else
      raise BadRequest
    end
  end

  private

    def configure_layout
      @body_class   = 'admin'
      @hide_sidebar = true
    end

    def find_blog
      id, page_title, month, year = params[:id], params[:path_title], params[:month], params[:year]
      if id == 'latest'
        @blog = Blog.last
      else
        @blog = id ? Blog.get( id ) : Blog.first( :path_title => page_title, :year => year, :month => month )
      end
      raise NotFound unless @blog
    end

    # Finds or creates the category that the blog post is related to
    def find_category
      cat_id = params[:blog].delete(:category_id)

      @category   = Category.get( cat_id )
      @category ||= Category.first_or_create( :title => cat_id );
    end

    def sweep_cache
      expire_page( :key => '/index' )
      expire_page( :key => url(:blog_by_date, @blog) )
      expire_page( :key => '/blogs.rss' )
    end

end
end # Admin

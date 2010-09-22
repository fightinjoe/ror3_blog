require 'redcloth'

class BlogsController < ApplicationController
  #include Merb::CommentsHelper
  include CommentsHelper

  before_filter :http_cache, :only => [:index, :show]

#  cache_pages :index, :show

  def index
    #provides :rss
    if params[:format] == 'rss'
      @blogs = Blog.get_rss
    else
      title     = params[:category_title]
      @category = title && Category.first( :title => title )

      raise NotFound if title && @category.nil?

      options = { :category_id => (@category ? @category.id : nil), :category_id.not => Category.about.id }
      @blogs  = Blog.paginate( options ).page( params[:page] )
    end

    respond_to do |format|
      format.html
      format.rss {
        response.headers["Content-Type"] = "application/xml; charset=utf-8"
        render
      }
    end
  end

  def show
    find_blog
    @category = @blog.category
    @comment  = Comment.new( :blog_id => @blog.id )
    render
  end

  def latest
    @blog = Blog.last( :category_id.not => Category.about.id )
    @category = @blog.category
    @comment  = Comment.new( :blog_id => @blog.id )
    render :show
  end

  private

    def find_blog
      id, page_title, month, year = params[:id], params[:path_title], params[:month], params[:year]
      #if id == 'latest'
      #  @about = Category.first(:title => 'About')
      #  @blog  = Blog.last( :category_id.not => (@about ? @about.id : -1) )
      #else
        @blog = id ? Blog.first( id ) : Blog.first( :path_title => page_title, :year => year, :month => month )
      #end
      raise NotFound unless @blog
    end

    # Utilize Heroku's HTTP cache, Varnish
    # http://docs.heroku.com/http-caching
    def http_cache
      response.headers['Cache-Control'] = 'public, max-age=300'
    end

end

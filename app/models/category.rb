class Category
  include DataMapper::Resource
#  include DataMapper::Reflection

  property :id, Serial

  property :title, String

  has n, :blogs

  def self.about
    Category.first_or_create(:title => 'About')
  end

end
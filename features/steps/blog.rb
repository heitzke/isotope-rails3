class Blog < Spinach::FeatureSteps
  feature 'Blog'

  include BasicIsotopeSteps

  When 'I am on the blog' do
    visit posts_path
  end

  When 'I am on the blog feed' do
    visit posts_path(format: 'atom')
  end

  Given 'there is a blog post' do
    @post = Factory(:post)
  end
end

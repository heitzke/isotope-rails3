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


  Given 'there is a tagged blog post' do
    @tagged_post = Factory(:post)
    @tagged_post.tag_list << "The Tag"
  end

  Then 'I should see the blog post' do
    visit post_path @tagged_post
  end

end

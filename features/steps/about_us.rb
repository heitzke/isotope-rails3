class AboutUs < Spinach::FeatureSteps
  feature 'About Us'

  include BasicIsotopeSteps

  When 'I am on the about page' do
    visit about_index_path
  end

  When 'I am on the about page for a given user' do
    @user = Factory(:user)
    @post = Factory(:post, user: @user)
    visit about_path(@user)
  end

  Then 'I should see some blog posts' do
    page.must_have_content 'Blog Posts'
  end
end

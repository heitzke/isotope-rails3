class Blog < Spinach::FeatureSteps
  feature 'Blog'

  include BasicIsotopeSteps

  When 'I am on the blog' do
    visit posts_path
  end
end

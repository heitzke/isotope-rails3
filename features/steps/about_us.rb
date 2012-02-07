class AboutUs < Spinach::FeatureSteps
  feature 'About Us'

  include BasicIsotopeSteps

  When 'I am on the about page' do
    visit about_index_path
  end
end

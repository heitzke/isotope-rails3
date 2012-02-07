class Home < Spinach::FeatureSteps
  feature 'Home'

  include BasicIsotopeSteps

  When 'I am on the home page' do
    visit root_path
  end
end

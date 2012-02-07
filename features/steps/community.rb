class Community < Spinach::FeatureSteps
  feature 'Community'

  include BasicIsotopeSteps

  When 'I am on the community page' do
    visit community_path
  end
end

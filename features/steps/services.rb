class Services < Spinach::FeatureSteps
  feature 'Services'

  include BasicIsotopeSteps

  When 'I am on the services page' do
    visit services_path
  end
end

class ContactUs < Spinach::FeatureSteps
  feature 'Contact'

  include BasicIsotopeSteps

  When 'I am on the contact page' do
    visit contact_index_path
  end
end

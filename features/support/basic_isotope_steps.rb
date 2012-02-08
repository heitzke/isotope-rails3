module BasicIsotopeSteps
  include Spinach::DSL

  Then 'I should see a basic page' do
    body.must_match 'isotope|eleven'
    page.driver.response.status.must_equal 200
  end
end

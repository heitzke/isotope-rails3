class Services < Spinach::FeatureSteps
  feature 'Services'

  include BasicIsotopeSteps

  When 'I am on the services page' do
    visit services_path
  end


  Then 'I should be able to view each service page successfully' do
    page.all(:xpath, "//a[@class='cover']").each do |service|
      service.click
      %Q{ Then I should see a basic page }
    end
  end

  Then 'each service page should be linked' do
    page.all(:xpath, "//a[@class='sibling_nav_link']").each do |nav_linked_service|
      nav_linked_service.click
      %Q{ Then I should see a basic page }
    end
  end

  When 'I am on a service page' do
    visit '/services/financial'
  end
end

class Services < Spinach::FeatureSteps
  feature 'Services'
  include ApplicationHelper
  include BasicIsotopeSteps

  When 'I am on the services page' do
    visit services_path
  end

  Then 'I should be able to view each service page successfully' do
    services = page.all(:xpath, "//a[@class='cover']")
    assert_equal(services_list_items.keys.count, services.count)
    services.each do |service|
      service.click
      %Q{ Then I should see a basic page }
    end
  end

  Then 'each service page should be linked' do
    nav_linked_services = page.all(:xpath, "//a[@class='sibling_nav_link']")
    assert_equal(services_list_items.keys.count, nav_linked_services.count)
    nav_linked_services.each do |nav_linked_service|
      nav_linked_service.click
      %Q{ Then I should see a basic page }
    end
  end

  When 'I am on a service page' do
    visit '/services/financial'
  end
end

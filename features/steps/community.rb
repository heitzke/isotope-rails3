class Community < Spinach::FeatureSteps
  feature 'Community'

  include BasicIsotopeSteps

  When 'I am on the community page' do
    visit community_path
  end

  Then 'I should be able to view each community project page successfully' do
    page.all(:xpath, "//a[@class='services_link']").each do |comm_proj|
      comm_proj.click
      %Q{ Then I should see a basic page }
    end
  end

  Then 'each community page should be linked' do
    page.all(:xpath, "//a[@class='sibling_nav_link']").each do |nav_linked_comm_proj|
      nav_linked_comm_proj.click
      %Q{ Then I should see a basic page }
    end
  end

  When 'I am on a community page' do
    visit '/community/xrono'
  end

end

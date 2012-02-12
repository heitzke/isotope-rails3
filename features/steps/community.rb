class Community < Spinach::FeatureSteps
  feature 'Community'
  include ApplicationHelper
  include BasicIsotopeSteps

  When 'I am on the community page' do
    visit community_path
  end

  Then 'I should be able to view each community project page successfully' do
    community_projects = page.all(:xpath, "//a[@class='services_link']")
    assert_equal(community_list_items.keys.count, community_projects.count)
    community_projects.each do |comm_proj|
      comm_proj.click
      %Q{ Then I should see a basic page }
    end
  end

  Then 'each community page should be linked' do
    nav_linked_community_projects = page.all(:xpath, "//a[@class='sibling_nav_link']")
    assert_equal(community_list_items.keys.count, nav_linked_community_projects.count)
    nav_linked_community_projects.each do |nav_linked_comm_proj|
      nav_linked_comm_proj.click
      %Q{ Then I should see a basic page }
    end
  end

  When 'I am on a community page' do
    visit '/community/xrono'
  end

end

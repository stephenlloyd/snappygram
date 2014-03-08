Given(/^I am on the upload page$/) do
  visit '/upload'
end

When(/^I add my photo$/) do
  attach_file 'snap_image', 'features/fixtures/cat.jpg' 
  fill_in 'snap_description', with: "I love this cat"
end

When(/^I click "(.+?)"$/) do |name|
  click_button name
end

Then(/^the photo should be on the timeline$/) do
  expect(page).to have_css "img"
  expect(page).to have_content 'I love this cat'
end

When(/^I add the following tags:$/) do |tags|
  tag_string = tags.hashes.map {|tag| tag[:text] }.join(',')

  fill_in 'snap_tag_list', with: tag_string
end

Then(/^I should see the following tags:$/) do |tags|
	tags.hashes.each do |tag|
		expect(page).to have_content tag[:text]
	end
end
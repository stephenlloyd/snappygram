Given(/^pusher is going to push$/) do
  expect(Pusher).to receive(:trigger)
end

Given(/^I am on the timeline$/) do
  visit '/'
end

When(/^someone uploads a snap$/) do
  Snap.create(description: 'the snap', image: File.new('features/fixtures/cat.jpg'))
end

Then(/^I should see the snap on the timeline$/) do
  snap = Snap.last
  expect(first('img')[:src]).to eq snap.image.url(:medium)
  expect(page).to have_content snap.description
end
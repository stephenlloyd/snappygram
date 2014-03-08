Feature: Pushering the snaps
	In order to know what is being snapped
	As a snapper
	I want to see the page updating

	Scenario: Pushing when uploading
		Given pusher is going to push
		And I am on the upload page
		When I add my photo
		And I click "Upload"
		Then the photo should be on the timeline

	@javascript
	Scenario: Receiving a push
		Given I am on the timeline
		When someone uploads a snap
		Then I should see the snap on the timeline
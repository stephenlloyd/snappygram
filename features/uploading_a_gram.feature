Feature: Uploading a gram
	In order to share my grams
	As a photographer
	I want to upload them to snappygram

	Scenario: The upload
		Given I am on the upload page
		When I add my photo
		And I click "Upload"
		Then the photo should be on the timeline

	Scenario: Uploading with tags
		Given I am on the upload page
		When I add my photo
		And I add the following tags:
			| text |
			| kat  |
			| LOL  |
		And I click "Upload"
		Then I should see the following tags:
			| text |
			| kat  |
			| LOL  |
		
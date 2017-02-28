# Objective
Explain at a high level the different ways to automated testing of web mapping applications and when you might want to use one method over another.

# Outline
Below is a rough rough skeleton of an outline. Please comment, modify, flesh out as you see fit.

## Intro (Brooks)
Test Pyramid
	- App layers and corresponding test types: 
		- UI tests for end-to-end confirmation in fully integrated environment, test via the UI through all the layers of the application.
		- Integration test for API/services; test connectivity, protocol, basic CRUD and data integrity.
		- Unit tests for internal logic and business rules core to the behavior of the application.
		- Performance testing; Not traditionally part of the test pyramid, but has value in establishing and maintaining a baseline request per second response time. Will tell you an app might not be performing well, but won’t tell you why.

What, Where, When and How to test and Whom?
	- Can your team agree automated tests are crucial and valuable?
	- Aligning dev and qa testing philosophies. Need for speed vs. test it all. Should always be a collaboration and negotiation to strike a healthy balance.
	- Who writes what?
		- Feature engineer will often use Unit tests; These live with code and are a powerful development tool to test designs; They're inexpensive, fast and isolated. Can be run locally and as often as needed.
		- Quality engineer will often use UI tests; These can be written outside of the application being tested. Tend to be thorough, long running, and test the full application stack via the browser.
	- Value of automated tests?
		Built-in insurance against regressions, can commit acceptance criteria to code.	
	- Where to invest?
		Depends on the complexity and depth of your application. Commitment to your customers, SLAs, TOS?

Automated tests vs. Test Automation?
	Automated tests are programmatic validations of functionality and features. These are repeatable programs that often live with the code. They help ensure consistency existing features and confirm new feature work properly based on customer requirements. UI, Integration, Unit tests.
	Test Automation is the process of running automated tests in a consistent way. Humans often forget, let computers run them for you. Continuious Integration - application provisioning, builds, versioning, deployments.


### Our story
On Open Data team, everyone likes to write tests (weird, I know), but finite resources and time, so have to be smart about what kinds of tests to write for different parts of application. We don't have this fully dialed in yet, it's a process, we want to share w/ you how we go about testing.

## Client-side Unit and Component Tests (Tom)

### Client-side Unit Tests
- Unit tests are good at:
 - algorithm "triangulation"
 - encourage good application architecture
- Not so good at:
 - preventing regressions (only for the unit you've tested)
 - visual (DOM) errors
- generally want to run front-end unit tests in the browser, not Node

### Component Tests
- When to write component tests
 - "fat" unit tests - DDAU
 - "mini" acceptance tests
- Not so good:
 - easy to start accidentally testing your framework instead of your own code
- examples
 - presentation component: loading spinner
 - form component: editor
 - container component: modal?
- have to execute component tests in the browser

### Unit and Component Tests for Maps
- Don't do it. That's Esri's job.
- In particular, JSAPI being Dojo based complicates things
- Mock the map (and other Esri components)

#### Demo
TODO: demo

## API tests? (Brooks)
TODO: fill in

## Selenium and Snapshot Tests (Jeremy)
TODO: fill in, below are some ideas that I copied over outline from Ember tests brown bag talk as a starting point:

- Good:
 - preventing regressions
 - testing in multiple browsers
 - testing CRUD
- Not so good:
 - flakey
 - slow to run

- Where to execute e2e tests?
 - server is good when testing CRUD b/c have direct access to DB during setup/teardown
 - client is good when want to run with unit tests or using framework specific helpers (angular's protractor see: https://github.com/Esri/angular-esri-map/tree/v1.x/test/e2e)

### Conclusion (Tom?)
So many ways to test, but finite time and resources, so need to be smart about how and what you test. Take ideas we've presented here as starting points to discuss ways to test your own applications w/ your team.

Questions.

To the bar!

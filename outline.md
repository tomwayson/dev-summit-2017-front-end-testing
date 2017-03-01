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

## Selenium and Screenshot Tests (Jeremy)

Recall testing pyramid, point at where this testing falls.

### Overview of Selenium and Visual Testing

- A way to drive a browser.  For testers, it's a programmed "Human"ish tester, with:
 - Hands/Fingers:
  - Navigate to sites (type into URL bar).
  - Type stuff in fields.
  - Move mouse, click buttons and links.
 - Eyes: See what happened (through a small peephole).
 - Brain/Mouth (provided by test framework, to note and report differences)
 - Needs to be told what precisely which DOM elements to interact with and look at, by:
  - Element ID. example: `SEARCH_ICON = {id: 'click-to-search'}`
  - CSS path. example: `DATASET_DOWNLOAD_FULL_SPREADSHEET={css: 'div#nav-download ul.dropdown-menu li:nth-of-type(2)'}`
  - XPath.  example: `SELECTOR={xpath: "//input[@value='Sign in']"}
 - API available in most languages -- Ruby, Java, etc.
 - Typically called from a test framework such as RSpec, Cucumber, Test::Unit

- Visual testing -- Perform scenarios with a web driver (Selenium) and then compare screenshots of observations to baseline screenshots.
 - Doesn't need to know or care _how_ page is built (DOM elements).
 - Lots of bang for your buck -- equivalent to many individual laboriously created Selenium-based assertions
 - Needs some tuning for sensitivity -- two screenshots of the same page on same computer (even with XVFB) can be slightly different.
 - Captures entire window -- so some differences you don't care about (say, date, carousel images) can cause false positives.
  - Mitigations:
   - Hide uninteresting elements before taking screenshot
   - Pay for full featured system (ex: Applitools Eyes)

- Pros:
 - Provides testing of full-stack end-to-end.
 - Finds regressions.
 - Testing in multiple browsers.
 - Testing CRUD -- sanity test of entire stack.
 - Validates the environment/deploy
 - Exercises the web application the same way a user does.

- Cons:
 - Slow to run -- need to be discriminating on what to decide to test
 - Needs full environment or enough mocking.
 - Can have flakey test results
 - Can be fragile -- better for regression tests, _after_ application under test is relatively stable.
 - Can be expensive to write
 - Require maintenance -- Pro Tip: use "page object model" to abstract site functionality.

#### Demo

Show selenium test running
  point out what it found

Show selenium test running _with visual testing_ added
  point out what it found (slightly shifted map -- simulating incorrect projection)

- Where to execute e2e tests?
 - server is good when testing CRUD b/c have direct access to DB during setup/teardown
 - client is good when want to run with unit tests or using framework specific helpers (angular's protractor see: https://github.com/Esri/angular-esri-map/tree/v1.x/test/e2e)

### Conclusion (Tom?)
So many ways to test, but finite time and resources, so need to be smart about how and what you test. Take ideas we've presented here as starting points to discuss ways to test your own applications w/ your team.

Questions.

To the bar!

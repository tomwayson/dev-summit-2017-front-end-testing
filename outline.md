# Objective
Explain at a high level the different ways to automated testing of web mapping applications and when you might want to use one method over another.

# Outline
Below is a rough rough skeleton of an outline. Please comment, modify, flesh out as you see fit.

## Intro (Brooks)

### Our story
On Open Data team, everyone likes to write tests (weird, I know), but finite resources and time, so have to be smart about what kinds of tests to write for different parts of application. We don't have this fully dialed in yet, it's a process, we want to share w/ you how we go about testing.

### Types of front end tests
- Define Front end tests as automated tests of:
 - part or all of a web application
 - client-side code, and optionally server-side code
- Show testing triangle
 - Unit: test a unit of code in isolation
 - Acceptance (e2e): Test drive the application by emulating user actions
 - Component: test a component in context of a page in a browser
 - performance (benchmark or load) tests
- NOTE: described the "ideal" for each type - totally possible to write bad unit tests that are not isolated and touch the entire stack
- Avoid these overloaded terms (at least in this discussion):
 - Integration: depends on perspective
 - Functional: useless term (testing a function? does the app function?)
- Many kinds of tests can be _executed_ in or out of the browser
 - for each type we'll discuss why you may want to execute in browser or not

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

## Performance? tests (Brooks)
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

### Conclusion (Brooks? Tom?)
So many ways to test, but finite time and resources, so need to be smart about how and what you test. Take ideas we've presented here as starting points to discuss ways to test your own applications w/ your team.

Questions.

To the bar!

# Objective
Explain at a high level the different ways to automated testing of web mapping applications and when you might want to use one method over another.

# Outline
Below is a rough rough skeleton of an outline. Please comment, modify, flesh out as you see fit.

## Intro (Tom?)

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
 - NOTE: described the "ideal" for each type - totally possible to write bad unit tests that are not isolated and touch the
- Not going to cover these types of tests:
 - performance (benchmark)
 - load tests
 - server-side unit tests
- Avoid these overloaded terms (at least in this discussion):
 - Integration: depends on perspective
 - Functional: useless term (testing a function? does the app function?)
- Most kinds of tests can be executed on either front or back end

## Client-side Unit and Component Tests (Tom)

### Client-side Unit Tests
- Unit tests are good at:
 - algorithm "triangulation"
 - encourage good application architecture
- Not so good at:
 - Only OK at preventing regressions
 - visual (DOM) errors

#### Demo
TODO: demo unit tests only? or one demo for both (prob better)

### Component Tests
- When to write component tests
 - "fat" unit tests - DDAU
 - "mini" acceptance tests
- Not so good:
 - ???
- examples
 - presentation component: loading spinner
 - form component: editor
 - container component: modal?

#### Demo
TODO: demo

## API tests? (Brooks)
TODO: fill in

## Selenium and Snapshot Tests (Jeremy)
TODO: fill in, below are some ideas that I copied over outline from Ember tests brown bag talk as a starting point:

- Good:
 - preventing regressions
 - testing in multiple browsers
- Not so good:
 - flakey
 - slow to run

### Conclusion (Tom?)
TODO: something along the lines of so many ways to test, finite, time and resources, so need to be smart about how and what you test. Take ideas we've presented here as starting points to discuss ways to test your own applications w/ your team.

Questions.

To the bar!

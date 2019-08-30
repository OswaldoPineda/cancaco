# CANACO Business to Bussiness

The project objective is to create an e-commerce system where all the business affiliated with the CANACO, can offer his services and products.

Also, the users can create requests of the products or services that they are requiring, and get notifications when the other users are searching for something.

## Table of contents

- [Pre-requisites](#Pre-requisites)
- [Usage.](#Usage)
- [Aditional information.](#Aditional-information)

## Pre-requisites

To maintain the same code structure we use [.editorconfig](docs/editor-config.md) click on the link to know how to install on different code editors.

### Before starting

[**rbenv**](https://github.com/rbenv/rbenv "rbenv Github repository") and [**rvm**](https://github.com/rvm/rvm "rvm Github repository") are management tools for **ruby** and **ruby on rails** versions that can be used for install the correct versions for the project. \
**Bundler** is a management of gems, in order to keep them always presents in development, staging and production for the project, you can install it from its [**official page**](https://bundler.io/ "Bundler Getting Started"). \
**PostgreSQL** is the database used in the project, and you can install it from its [**official page**](https://www.postgresql.org/download/ "PostgreSQL Downloads"). \
With **Redis** you can save process to be executed later, also, you can install it from its [**official page**](https://redis.io/download "Redis Download & Installation").

### Required versions

These are the required versions to start to work in the CANACO project. \
There gems should be installed in the system.

- Ruby 2.6.3
- Rails 5.2.3
- Bundler 2.0.2
- Redis 4.0.1

## Usage

### Settings

How to start to use web application of CANACO.

## Aditional information

This section presents a description of how to perform integration tests and unit tests automatically. In addition, the allowed schedules that were agreed to make changes in the master branch of the project are presented.

### Running Tests

If you want to verify that all tests (unit tests and integration tests) work correctly, type the follow command:

```
bundle exec rake
```

Otherwise, if you need to run only the unit tests, you must specify their folder, for example:

```
bundle exec rspec spec/controller
```

The above command executes all unit tests for the controllers. To run only the integration test, you need to specify the folder where these :

```
bundle exec rspec spec/features
```

The project requires a tool for ruby called [SimpleCov](https://github.com/colszowka/simplecov "SimpleCov official documentation").  SimpleCov is a code coverage analysis, this tool allows us to check the coverage of code that has been tested to evaluate its correct function.
You can make use of this tool, executing all the tests in your project and copy the last line that looks like `/path-your-project-location/coverage`, after you need to paste this in the navigation bar of your browser.




### Linters Included

For avoid errors and mantain clean code we use the follow tools:

- [Rubocop](https://github.com/rubocop-hq/rubocop "Rubocop official documentation")
- [Erblint](https://github.com/Shopify/erb-lint "Erblint official documentation")

Rubocob verifies the syntax and logical code and ruby ​​conventions in the .rb files. When there are errors, rubocop returns a red message with the number of line of the error and a brief description of it, otherwise, it returns a green message with the legend "no offenses detected".\
Erblint works just like rubocop, the difference is that erblint only checks the html files with embedded ruby ​​code (html.erb).

### Running Linters

In this project, we use a pre-commit hook to run tests automatically before to make a commit, in order to avoid broken builds. To do this configuration in git, you need to install [Husky](https://github.com/typicode/husky "Husky official documentation") to run linters before each commit by doing `yarn install`.


### Deploy zones:

- Monday-Friday: no later than 3:00pm.
- Weekend: no deploys (unless a special circumstance where the whole team is working).

### General Ruby code quality

We use ruby critic to get a score that shows the quality

`$ rubycritic`

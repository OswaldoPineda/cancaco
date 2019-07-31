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
With **Redis** you can save process to be executed later, also, you can installe it form its [**official page**](https://redis.io/download "Redis Download & Installation").

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

### Running Tests

```
bundle exec rake
```

### Linters Included:

- Rubocop
- erblint

### Running Linters

Install Husky to run linters before each commit by doing `yarn install`.


### Deploy zones:

- Monday-Friday: no later than 3:00pm.
- Weekend: no deploys (unless a special circumstance where the whole team is working).

### General Ruby code quality

We use ruby critic to get a score that shows the quality

`$ rubycritic`
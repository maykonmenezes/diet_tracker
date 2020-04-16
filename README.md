# Dietracker

A diet tracker to help manage diet plans and monitoring weight loss.

## How to get it running

These instructions bellow will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You only need to clone the project and have ruby installed on your local machine.

```
$ git clone https://github.com/maykonmenezes/diet_tracker

```

### Installing

To get it running in development

You only need to run the command `bundle`

```
$ bundle install
```

And done! it will install the dependencies for you.


## Setting up the database

```
$ rails db:setup
```

## Running the server

```
$ rails server
```

## Running the tests

You can run the test suite of automated tests by running the bellow command on the project root by prompt:

`$ rspec` to run all tests or `$ rspec spec/path/to/test` to run a single one.


## Built With

* [Ruby](https://www.ruby-lang.org/) - A dynamic, open source programming language.
* [Rails](https://rubyonrails.org/) - A ruby web framework
* [Pundit](https://github.com/varvet/pundit) - Minimal authorization through OO design and pure Ruby classes
* [RSpec](https://rspec.info/) -  Testing tool written in Ruby to test Ruby code.
* [SimpleCov](https://github.com/colszowka/simplecov) - Used to generate test coverage report.


## Authors

* **Maykon Menezes** - *professional profile* - [linkedin](https://br.linkedin.com/in/maykon-menezes-243368ab)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

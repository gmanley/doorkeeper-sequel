# Doorkeeper Sequel ORM extension
[![GitHub release](https://img.shields.io/github/release/nbulaj/doorkeeper-sequel.svg?maxAge=2592000)]()
[![Build Status](https://travis-ci.org/nbulaj/doorkeeper-sequel.svg?branch=master)](https://travis-ci.org/nbulaj/doorkeeper-sequel)
[![Dependency Status](https://gemnasium.com/nbulaj/doorkeeper-sequel.svg)](https://gemnasium.com/nbulaj/doorkeeper-sequel)
[![Code Climate](https://codeclimate.com/github/nbulaj/doorkeeper-sequel/badges/gpa.svg)](https://codeclimate.com/github/nbulaj/doorkeeper-sequel)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](#license)

`doorkeeper-sequel` provides [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) support to [Sequel](https://github.com/jeremyevans/sequel) database toolkit.

## Requirements

* Doorkeeper >= 4.0
* Rails >= 4.2 (Doorkeeper dropped support of lower versions)
* Sequel >= 4

## Installation

To start using the Doorkeeper Sequel ORM, add to your Gemfile:

``` ruby
gem 'doorkeeper-sequel', github: 'nbulaj/doorkeeper-sequel'
```

Set the Doorkeeper ORM configuration:

``` ruby
Doorkeeper.configure do
  orm :sequel
end
```

Generate migrations:

```
rails generate doorkeeper:sequel:migration
rails generate doorkeeper:sequel:application_owner
rails generate doorkeeper:sequel:previous_refresh_token
```

## Tests

To run tests, clone this repository and run `rake`. It will copy and run
`Doorkeeper`’s original test suite, after configuring the ORM and other stuffs.

```
$ bundle exec rake
```

## Contributing

You are very welcome to help improve `doorkeeper-sequel` if you have suggestions for features that other people can use or some code improvements.

To contribute:

1. Fork the project.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run <tt>rake doc:yard</tt>. If your changes are not 100% documented, go back to step 4.
6. Add tests for your feature or bug fix.
7. Run `rake` to make sure all tests pass.
8. Commit your changes (`git commit -am 'Add new feature'`).
9. Push to the branch (`git push origin my-new-feature`).
10. Create new pull request.

Thanks.

## License

Doorkeeper-sequel gem is released under the [MIT License](http://www.opensource.org/licenses/MIT).

Copyright (c) 2016 Nikita Bulaj (bulajnikita@gmail.com).

---

Please refer to https://github.com/doorkeeper-gem/doorkeeper for instructions on
doorkeeper’s project.

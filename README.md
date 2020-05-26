# ERB example with tests

A quick spike to show how to create files from ERB templates files with some
simple unit tests to go along side.

To run:

```bash
bundler install
ruby lib/main.rb
```

This will produce an output directory and a number of files based of the
templates in ./dashboards

To run tests:

```bash
bundle exec rspec
```

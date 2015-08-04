# Pipelinedeals::Client

This gem is designed to communicate with the *Pipeline Deals API*
through instantiation of the main class **PipelineDeals::Client**.
To instantiate you need the api key from a Pipeline Deals account.

This Gem supports the following **Pipeline Deals API** methods:

* People
* Users
# Person_custom_fields(get)

All methods in this gem use **JSON** formatting. To read on the Pipeline API please visit (https://www.pipelinedeals.com/api/docs/introduction)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pipelinedeals-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipelinedeals-client

## Usage

To begin:

```ruby
pipeline = PipelineDeals::Client.new(api_key)
```
To check if a successful connection can be made to the API:

```ruby
pipeline.ping
```
This will return *true* or *false*.

The get methods support pagination and the default page size is 200.
To get the people on the first page (first 200):
```ruby
response = pipeline.people
```
The response includes metadata for pagination.
```ruby
response["per_page"]
```

You can also get people on a particular page:
```ruby
pipeline.people(2)
```
This will get all the users on the second page.

To create a person on *Pipeline Deals*:
```ruby
pipeline.create_person(person)
```
The person parameter has to be formatted according to (https://www.pipelinedeals.com/api/docs/examples).


## Contributing

1. Fork it ( https://github.com/[my-github-username]/pipelinedeals-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

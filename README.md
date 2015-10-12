# URL Scrambler

[![Code Climate](https://codeclimate.com/github/hooroo/url_scrambler/badges/gpa.svg)](https://codeclimate.com/github/hooroo/url_scrambler)
[![Test Coverage](https://codeclimate.com/github/hooroo/url_scrambler/badges/coverage.svg)](https://codeclimate.com/github/hooroo/url_scrambler/coverage)

![](http://i.imgur.com/jQiWjwG.gif)

URL Scrambler takes your objects and scrambles them into URL-safe strings that
you can throw around your applications. If you need to keep the innards of your
objects a secret, there's also support for symmetric encryption - which
Just Works™ in Rails.

At the heart of it all is MessagePack, so your scrambled objects are also
easily portable between languages.

## Getting Started

In your Gemfile:

```ruby
gem 'url_scambler', '~> 1.0.0'
```

And then...

```sh
$ bundle install
```


## Start Scrambling!

Just call `encode()` and pass in your object du jour.

```ruby
something = {foo: "bar"}
encoded = UrlScrambler.encode(something)
# => ""
```

To get your object back, just pass the encoded string into `decode()`.

```ruby
UrlScrmabler.decode(encoded)
# => {foo: "bar"}
```

:tada::tada::tada:


## Keeping Your Things a Secret

URL Scrambler has basic support for symmetric encryption, if you're looking to
keep your pesky end-users from poking around your data. All you need to do is
call `secure()` passing in your secret key


```ruby

UrlScrambler.secure(key).encode({foo: bar})
UrlScrambler.secure(key).decode("....")

UrlScrambler.secure(key).encode({foo: bar})
UrlScrambler.secure(key).decode("....")
```

*In Rails* things are (optionally) a little simpler. If you don't supply a key,
URL Scrambler will use your application's secret:

```ruby
UrlScrambler.secure.encode({foo: "bar"})
# => "..."
```


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

Please refer to each project's style guidelines and guidelines for submitting
patches and additions.

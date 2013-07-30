Amount Inflector
================
[![Build Status](https://travis-ci.org/drKreso/amount_inflector.png)](https://travis-ci.org/drKreso/amount_inflector)

This gem can be used for:

1. converting number amounts to words in HRK currency
2. pluralizing year/month/week/day and other words in Croatian that depend on :one, :few, :many rule

```ruby
NumberToKune.convert(97_543.21) #=> "devedesetsedamtisućapetstočetrdesettri kune i dvadesetjedna lipa"
AmountInflector.inflect(77, :godina).to_s #=> 77 godina
```

Usage
----------

Put in your GemFile:

```
gem 'amount_inflector'
```

And then:

```
bundle
```

Release notes
-------------
v.3.0.2
  - added support for inflection :promet
v.3.0.3
  - Fixed strange bug, but lost fine tuning for 101_000 amount

Contributing to amount_inflector
---------------------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
-----------

Copyright (c) 2012 Kresimir Bojcic. See LICENSE.txt for
further details.


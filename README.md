Amount Inflector
================
This is one of those things that are kinda cool but it never seems to be enough time to implement it. The basic idea is engine that will enable you to have amounts of certain units "humanized" in your native language.

In English it is quite simple:

```
1 week
2 weeks...
2002020 weeks
```

In some other language it is not as simple, for example "week" in Croatian:

```
1 tjedan
2 tjedna
3 tjedna 
4 tjedna
5 tjedana....
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

In your code

```
AmountInflector.inflect(77, :godina).to_s #=> 77 godina
```

Is It For Me?
--------------
This is basically reimplementation of stuff I18n provides with :one, :few and :many

[Example for Polish](http://dev.netizer.pl/rails-i18n-and-zero-one-two-few-many-other.html)
```ruby
# config/locales/pluralization.rb
I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)
{
:pl => {:'i18n.plural.rule' => lambda { |n| n == 1 ? :one : (2..4).include?(n % 10) && !(11..14).include?(n % 100) ? :few : :other }},
}
```
Only usage would be if you prefer not to use the whole I18n machinery for this simple task.

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


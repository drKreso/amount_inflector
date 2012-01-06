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

rails g amount_inflector:install
```

In your code

```
  AmountInflector.new(77, :godina).to_s #=> 77 godina
```

Tweaking
-----------
As for now only Croatian year/month/week/day is supported(config/locales/amount_inflections.yml)

```
godina: 
  default:  godina
  2:        godine
  3:        godine
  4:        godine
  12:       godina
  13:       godina
  14:       godina
mjesec:
  default: mjeseci
  1:       mjesec
  2:       mjeseca
  3:       mjeseca
  4:       mjeseca
  11:      mjeseci
  12:      mjeseci
  13:      mjeseci
  14:      mjeseci
tjedan: 
  default: tjedana
  1:       tjedan
  2:       tjedna
  3:       tjedna
  4:       tjedna
  11:      tjedana
  12:      tjedana
  13:      tjedana
  14:      tjedana
dan: 
  default: dana 
  1:       dan
  11:      dana
```

If you have 2011 months for example (mjesec) the algorithm is:

* Check for 2011 in inflections
* Check for 011 in inflections
* Check for 11 in inflections => match it is "2011 mjeseci"


If you have 77 years for example (godina) the algorithm is:

* Check for 77 in inflections
* Check for 7 in inflections
* Check for :default in inflections => match it is "7 godina"

Is It For Me?
--------------
I have a suspicion that Croatian model might work quite well for some other languages. Anyways if you have some exceptions but not that many and if they tend to depend on "trailing digits" then amount_inflector is a right way to go.

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


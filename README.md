# chuck

Add helpful facts about Chuck Norris, Bruce Schneier, or anyone else, to your Ruby apps.

## Usage

In its simplest form, if you just want a random Chuck Norris fact from the Internet Chuck Norris Database, you can just
call the class method `retrieve`, which will return you a Chuck instance.

    1.9.3p194 :008 > Chuck.retrieve.joke
    => "Chuck Norris can compile syntax errors."

Some options may be passed to the retrieve method to be sent along with the API request to the Internet Chuck Norris Database, like so...

    1.9.3p194 :008 > Chuck.retrieve(first_name: 'Max', last_name: 'Stahl').joke

## Contributing to chuck
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 max thom stahl. See LICENSE.txt for
further details.


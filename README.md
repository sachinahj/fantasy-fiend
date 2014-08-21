# Fantasy Fiend

A Rails-based app meant to help Fantasy Footballers during their live fantasy football draft. The information was scraped/imported from FantasyPros.com and FantasyData.com, compiled into a PostgreSQL database, and then a frontend was built on top of it using JavaScript (Underscore.js, Select2, DataTables, and HighCharts) and HTML5/CSS3 (Twitter Bootstrap).

The latest information was gathered on August 9, 2014. The projections and stats are based on a points per reception(PPR) fantasy league scoring system.

Tech Stack: AppleScript, Rails, JavaScript, and Twitter Bootstrap.

## Developers

### Install
Uses Rails 4 with bundler 

    cd /tmp
    git clone https://github.com/sachinahj/fantasy-fiend.git
    cd fantasy-fiend
    bundle install
    bundle exec rake db:create
    bundle exec rake db:migrate
    rails s

Go to http://0.0.0.0:3000/




### Documentation 

## Thank You!

Special thanks to MakerSquare for all the help!
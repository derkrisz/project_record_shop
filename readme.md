 # Rick's Records

A stock tracker web app for a record store. The user is available to add artists and albums, delete and edit the stock. It also displays buy/sell prices, markup and has a colour-coded stock level meter.

## Getting Started

Pull the files from Github for personal use, and install prerequisites.

## Prerequisites

1. Ruby
2. PostgreSQL
3. Sinatra
4. Browser for HTML/CSS

## To start the program:

1. In the main directory, use `psql-d record_shop -f db/record_shop.sql` to create the database
2. Seed the database by using the seeds.rb file `ruby db/seeds.rb`
3. Start the Sinatra server with record_shop_controller.rb `ruby record_shop_controller.rb`
4. Navigate to localhost:4567/ in your browser to start the app.

### Created With

Ruby, PostgreSQL, Sinatra, HTML and CSS

### Authors

Krisztian Der

#### Acknowledgements

Tutors at CodeClan and classmates in Cohort 17.

# Rick's Records

A stock tracker web app for a record store. The user is available to add artists and albums, delete and edit the stock. It also displays buy/sell prices, markup and has a colour-coded stock level meter.

### MVP:

- Create albums with the quantity that are in stock
- Create artists
- Show an inventory page listing albums and artists
- Show a stock level for the inventory items e.g. High/Medium/Low
### Possible Extensions:

- Add a buy and sell price to each stock item
- Calculate the possible markup on items and show on inventory page
- Add a genre to an Album
- Any other ideas you might come up with

## Getting Started

Pull the files from Github for personal use, and install prerequisites.

### Prerequisites

1. Ruby
2. PostgreSQL
3. Sinatra
4. Browser for HTML/CSS

### To start the program:

1. In the main directory, use `psql-d record_shop -f db/record_shop.sql` to create the database
2. Seed the database by using the seeds.rb file `ruby db/seeds.rb`
3. Start the Sinatra server with record_shop_controller.rb `ruby record_shop_controller.rb`
4. Navigate to localhost:4567/ in your browser to start the app.

### Created With

Ruby, PostgreSQL, Sinatra, HTML and CSS

#### Author

Krisztian Der

#### Acknowledgements

Tutors at CodeClan and classmates in Cohort 17.

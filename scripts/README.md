# Player Feeder

## How to collect data for the script

### Set Up

- Visit ultimate footy
- Log in and select flint mich league
- Select league overview
- Scroll down to history tab, and select the season you want (click the year)
- For each match, of each round, of each year, we collect the data into a file and folder structure like `year/rd_x/game_y`. For an example of this see the folder see `flint-utility/scripts/round_by_players`

### Gathering the data

Collect the data for each game by:

- Open the matchup summary of the game
- Right click on the page and select Inspect Element. This will open up the HTML inspector. Leave this pane open as you move onto more matches
- Under the main `<body>` tag you should see in green (a comment) `<!-- Ultimate Sports ================================================== -->`
- Expand the container underneath this comment.
- Inside this expanded container you should see `<!-- Game Content ================================================== -->`
- Right click on the `<div class="row">...</div>` directly below the Game Content comment, and select Copy > Inner HTML
- Paste this into the file game_y
- Repeat for every game of every year! Navigate to other matches and rounds by using the round summary table

## Running the script

- create (`python3 -m venv venv`) then activate (`source venv/bin/activate`) the virtual environment
- run the script `python3 player_feeder.py <DB NAME> <PATH OF TARGET DATA> [-c --commit] [-l --logging]`

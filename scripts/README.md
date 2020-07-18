# Player Feeder

## How to collect data for the script

visit ultimate footy
log in and select flint mich league
select league overview
scroll down to history tab
and select the season you want (click the year)

For each match, of each round, of each year, we collect the data into a file and folder structure like `year/rd_x/game_y`

Collect the data for each game by:
opening the matchup summary of the game
Right click on the page and select Inspect Element.  This will open up the HTML inspector.  Leave this pane open as you move onto more matches
Under the main `<body>` tag you should see in green (a comment) `<!-- Ultimate Sports ================================================== -->`
Expand the container underneath this comment.

Inside this expanded container you should see `<!-- Game Content ================================================== -->`
Right click on the `<div class="row">...</div>` directly below the Game Content comment, and select Copy > Inner HTML
Paste this into the file game_y

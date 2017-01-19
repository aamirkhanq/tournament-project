# Tournament Results
This project evaluates the result of a tournament. It stores the records of players in a PostgreSQL database. The database file `tournament.sql` can be ran at the Linux command prompt with:
`psql -c '\i tournament.sql`
Whatever commands are in `.sql` file will get run. To see whether all queries on the database are executing properly, you need to run `tournament_test.py`. It can be run on the Linux command line with:
`python tournament_test.sql`

### List of modules
- `tournament.py`: It contains functions for querying the database.
- `tournament_test.py`: It creates test cases for `tournament.py` module.
- `tournament.sql`: It contains the schema for the project.

### List of functions
There are a couple of functions defined inside both `tournament.py` and `tournament_test.py`. The functions defined in the latter are for testing the functions defined in the former.
- `tournament.py`
  - **Function Definitions**:
    1. `connect()`: Establishes a connection to PostgreSQL server by fetching a `Connection` object.
	2. `registerPlayer(name)`: Adds a player to the tournament by putting an entry in the database. Every player is given a unique ID.
	3. `countPlayers()`: Returns the number of currently registered players.
	4. `deletePlayers()`: Clear out all the player records from the database.
	5. `reportMatch(winner, loser)`: Stores the outcome of a single match between two players in the database.
	6. `deleteMatches()`: Clear out all the match records from the database.
	7. `playerStandings()`: Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.
	8. `swissPairings()`: Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players.
- `tournament_test.py`
  - ** Function Definitions**:
    1. `testCount()`: Checks if the records are getting added and deleted correctly.
	2. `testStandingsBeforeMatches()`: Checks if the players are properly represented before any matches are reported.
	3. `testReportMatches()`: Checks if the matches are being reported properly.
	4. `testPairings()`: Checks if the pairings are generated properly both before and after match reporting.

### List of tables
Following tables are present in the schema:
- `players`: It keeps track of the names of players and assigns an ID to the name.
- `matches`: It stores the winner and loser from a particular match.
- `winners`: It stores the number of matches won by a player.
- `losers`: It stores the number of matches lost by a player.
- `num_of_matches`: It stores the details of number of matches played by each player.
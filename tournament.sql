-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;
create database tournament;
\c tournament;
create table players(
player text,
id serial primary key
);

create table matches(
winner serial references players(id),
loser serial references players(id)
);

create view winners as
select players.id, count(matches.winner) as num_wins
from players left join matches
on players.id = matches.winner 
group by players.id;

create view losers as
select players.id, count(matches.loser) as num_losses
from players left join matches
on players.id = matches.loser 
group by players.id;

create view num_of_matches as
select winners.id, winners.num_wins, (winners.num_wins+losers.num_losses) as num_matches
from winners join losers
on winners.id = losers.id;

create view player_standings as
select players.id, players.player, num_of_matches.num_wins, num_of_matches.num_matches 
from players join num_of_matches 
on players.id = num_of_matches.id 
order by num_of_matches.num_wins;

SELECT 'CREATE DATABASE worldcup' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'worldcup')\gexec

\c worldcup;

CREATE table teams(team_id serial primary key not null ,name varchar(40) unique not null);


-- posibility two
    CREATE table games(game_id serial primary key not null,year int not null,round varchar(30) not null,winner_id int not null, opponent_id int not null,winner varchar(20) not null,opponent varchar(20) not null,winner_goals int not null,opponent_goals int not null,
    constraint fk_winner_team foreign key(winner_id) references teams(team_id)
);
    alter table games add constraint fk_opponent_team foreign key(opponent_id) references teams(team_id);
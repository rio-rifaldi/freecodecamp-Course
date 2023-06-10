#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

# PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
# echo $($PSQL "TRUNCATE games,teams") #? delete all data

cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then

    # get winner team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # insert team
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # if inserted success
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
      then 
        echo $INSERT_WINNER
      # get new team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE team_id='$WINNER_ID'")
      echo "Insert success : ${WINNER_NAME}"
      fi
    fi

    # ---------------------------------------------------------------------------------------
    # insert opponent
    # ---------------------------------------------------------------------------------------
      # get winner team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert team
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      # if inserted success
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
      then 
        echo $INSERT_OPPONENT
        # get new team_id
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE team_id='$OPPONENT_ID'")
        echo "Insert success : ${OPPONENT_NAME}"
      fi
    fi
    
    # ---------------------------------------------------------------------------------------
    # insert games
    # ---------------------------------------------------------------------------------------
    INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then
      echo $INSERT_GAMES
      echo "Insert success : $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS"
    fi

  fi 
  
done





# echo $($PSQL "TRUNCATE teams,games");

# cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
#   do
#     if [[ $WINNER != "winner" ]]
#     then 
#       SELECT_WINNER_TEAM=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
#       if [[ -z $SELECT_WINNER_TEAM ]]
#       then
#         ADD_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
#         echo $ADD_WINNER
#       fi

#       SELECT_OPPONENT_TEAM=$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")
#       if [[ -z $SELECT_OPPONENT_TEAM ]]
#       then
#          ADD_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
#          echo $ADD_OPPONENT
#       fi
#     fi 
      
#       # get winner_id;
#       WINNER_ID=$($PSQL "SELECT team_id from teams WHERE name='$WINNER'")
#       OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name='$OPPONENT'")

#       # insert into games

#       RESULT_INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner,opponent,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,'$WINNER','$OPPONENT',$WINNER_GOALS, $OPPONENT_GOALS)")

#       if [[ $RESULT_INSERT_GAME == "INSERT 0 1" ]]
#       then
#         echo $YEAR,$ROUND,$WINNER_ID,$OPPONENT_ID,$WINNER,$OPPONENT,$WINNER_GOALS, $OPPONENT_GOALS INSERTED
#       fi

#   done


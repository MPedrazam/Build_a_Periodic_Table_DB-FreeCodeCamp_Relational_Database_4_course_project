If you run ./element.sh, it should output Please provide an element as an argument. and finish running.

If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output The element with atomic number 1 is Hydrogen (H). 

It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.

If the argument input to your element.sh script doesn't exist as an atomic_number, symbol, or name in the database, the output should be I could not find that element in the database.

#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\nPlease provide an element as an argument"
read ELEMENT_INPUT

if [[ $ELEMENT_INPUT =~ ([1-9]|10) ]]
then
  RESULT_1 = $($PSQL "SELECT name, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
            FROM elements E INNER JOIN properties P ON  E.atomic_number = P.atomic_number LEFT JOIN types T ON P.type_id = T.type_id
            WHERE atomic_number = $ELEMENT_INPUT")
  echo RESULT_1 | while read $NAME BAR $TYPE BAR $ATOMIC_MASS BAR $MELTING_POINT BAR $BOILING_POINT
  echo "\nIt's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  
else 
  echo -e "\nI could not find that element in the database"
fi



if [[ ! $ELEMENT_INPUT =~ ((^[A-Z]{1})([a-z]){0,1}$) ]]
then
  echo -e "\nI could not find that element in the database"
else
  RESULT_2 =   RESULT = $($PSQL "SELECT name, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
            FROM elements E INNER JOIN properties P ON  E.atomic_number = P.atomic_number LEFT JOIN types T ON P.type_id = T.type_id
            WHERE symbol = '$ELEMENT_INPUT'")
  if [[ -z $RESULT_2 ]]
  then
    echo -e "\nI could not find that element in the database"
  else
    echo RESULT_2 | while read $NAME BAR $TYPE BAR $ATOMIC_MASS BAR $MELTING_POINT BAR $BOILING_POINT
    echo "\nIt's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi

if [[ ! $ELEMENT_INPUT =~ ((^[A-Z]{1})([a-z])+$) ]]
then
  echo -e "\nI could not find that element in the database"
else
  RESULT_3 =   RESULT = $($PSQL "SELECT name, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
            FROM elements E INNER JOIN properties P ON  E.atomic_number = P.atomic_number LEFT JOIN types T ON P.type_id = T.type_id
            WHERE name = '$ELEMENT_INPUT'")
  if [[ -z $RESULT_3 ]]
  then
    echo -e "\nI could not find that element in the database"
  else
    echo RESULT_3 | while read $NAME BAR $TYPE BAR $ATOMIC_MASS BAR $MELTING_POINT BAR $BOILING_POINT
    echo "\nIt's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi

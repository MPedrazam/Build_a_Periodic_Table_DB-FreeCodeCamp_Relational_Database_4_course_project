#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo -e "\nPlease provide an element as an argument."
read ELEMENT_INPUT


if [[ $ELEMENT_INPUT =~ (^[1-9]$|^10$) ]] # if values betwenn 1-10
then

# valid atomic_number is provided
  RESULT_1=$($PSQL "SELECT name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, P.atomic_number, symbol FROM elements E INNER JOIN properties P ON  E.atomic_number = P.atomic_number LEFT JOIN types T ON P.type_id = T.type_id WHERE E.atomic_number = $ELEMENT_INPUT") 
  echo $RESULT_1 | while read NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR ATOMIC_N BAR SYMBOL
  do
  echo -e "\nThe element with atomic number $ATOMIC_N is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done 

elif [[ $ELEMENT_INPUT =~ ((^[A-Z]{1})([a-z]{0,1}$)) ]]
then
#if valid symbol provided matching the regrex
    RESULT_2=$($PSQL "SELECT name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, P.atomic_number, symbol FROM elements E INNER JOIN properties P ON E.atomic_number = P.atomic_number LEFT JOIN types T ON P.type_id = T.type_id WHERE symbol = '$ELEMENT_INPUT'")
    
    # if the query has a result
    if [[ ! -z $RESULT_2 ]]
    then
        echo $RESULT_2 | while read NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR ATOMIC_N BAR SYMBOL
        do
        echo -e "\nThe element with atomic number $ATOMIC_N is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    
    #if the query is empty 
    else
        echo -e "\nI could not find that element in the database."
    fi

elif [[ $ELEMENT_INPUT =~ ((^[A-Z]{1})([a-z]{3,8}$)) ]]
then

#if match the regrex
  RESULT_3=$($PSQL "SELECT name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, P.atomic_number, symbol FROM elements E INNER JOIN properties P ON  E.atomic_number = P.atomic_number LEFT JOIN types T ON P.type_id = T.type_id WHERE name = '$ELEMENT_INPUT'")

#if the query has a result
  if [[ ! -z $RESULT_3 ]]
  then
    echo $RESULT_3| while read NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR ATOMIC_N BAR SYMBOL
    do
    echo -e "\nThe element with atomic number $ATOMIC_N is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done

  #if the query is empty 
  else
    echo -e "\nI could not find that element in the database."
    fi

# if any creteria is meet.    
else
    echo -e "\nI could not find that element in the database."
fi

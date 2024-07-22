#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no arguments passed
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if the argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, type,  melting_point_celsius, boiling_point_celsius, atomic_mass, name, symbol FROM properties JOIN elements USING(atomic_number) join types using(type_id)  WHERE atomic_number = $1;")
  # if argument is not a number
  else
    ELEMENT=$($PSQL "SELECT atomic_number, type,  melting_point_celsius, boiling_point_celsius, atomic_mass, name, symbol FROM properties JOIN elements USING(atomic_number) join types using(type_id) WHERE symbol = '$1' OR name = '$1'")
  fi

  # if there is something in the ELEMENT variable
  if [[ -n $ELEMENT ]]
  then
    IFS='|' read -r ATOMIC_NUMBER TYPE MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS ATOMIC_MASS NAME SYMBOL <<< "$ELEMENT"
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  else
    echo "I could not find that element in the database."
  fi
fi

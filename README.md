# Periodic Table Database: FreeCodeCamp Relational Database course project

This is the fourth requeried project in the FreeCodeCamp Relational Database Certification.

The project aims to use Bash, PostgreSQL and Git to edit a chemical elements database and display an answer regarding the user input.

https://www.freecodecamp.org/learn/relational-database/build-a-periodic-table-database-project/build-a-periodic-table-database

The project task are:

    1. You should rename the weight column to atomic_mass

    2. You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius

    3. Your melting_point_celsius and boiling_point_celsius columns should not accept null values

    4. You should add the UNIQUE constraint to the symbol and name columns from the elements table

    5. Your symbol and name columns should have the NOT NULL constraint

    6. You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table

    7. You should create a types table that will store the three types of elements

    8. Your types table should have a type_id column that is an integer and the primary key

    9. Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table

    10. You should add three rows to your types table whose values are the three different types from the properties table

    11. Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint

    12. Each row in your properties table should have a type_id value that links to the correct type from the types table

    13. You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others

    14. You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. Be careful not to change the value

    15. You should add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal

    16. You should add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal

    17. You should create a periodic_table folder in the project folder and turn it into a git repository with git init

    18. Your repository should have a main branch with all your commits

    19. Your periodic_table repo should have at least five commits

    20. You should create an element.sh file in your repo folder for the program I want you to make

    21. Your script (.sh) file should have executable permissions

    22. If you run ./element.sh, it should output Please provide an element as an argument. and finish running.

    23. If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

    24. If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.

    25. If the argument input to your element.sh script doesn't exist as an atomic_number, symbol, or name in the database, the output should be I could not find that element in the database.

    25. The message for the first commit in your repo should be Initial commit

    26. The rest of the commit messages should start with fix:, feat:, refactor:, chore:, or test:

    27. You should delete the non existent element, whose atomic_number is 1000, from the two tables

    28. Your properties table should not have a type column

    29. You should finish your project while on the main branch. Your working tree should be clean and you should not have any uncommitted changes




# 1. You should rename the weight column to atomic_mass
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;


# 2. You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;


# 3. Your melting_point_celsius and boiling_point_celsius columns should not accept null values
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;


# 4. You should add the UNIQUE constraint to the symbol and name columns from the elements table
ALTER TABLE elements ADD CONSTRAINT unique_cons UNIQUE (symbol, name);


# 5. Your symbol and name columns should have the NOT NULL constraint
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

# 6. You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);

# 7. You should create a types table that will store the three types of elements
# 8. Your types table should have a type_id column that is an integer and the primary key
# 9. Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
# 10. You should add three rows to your types table whose values are the three different types from the properties table

CREATE TABLE types (
    type_id INT PRIMARY KEY,
    type VARCHAR NOT NULL);
    
ALTER TABLE types(type_id, type) 
  VALUES (
    1, 'nonmetal'), 
    (2, 'metal'), 
    (3, 'metalloid'
    );

# 11. Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
# 12. Each row in your properties table should have a type_id value that links to the correct type from the types table

ALTER TABLE properties ADD COLUMN type_id INT NOT NULL FOREIGN KEY REFERENCES type(type_id);

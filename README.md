# Periodic Table Database Project

## Project Overview

This project is the fourth of five projects required to earn the Relational Database Certification from freeCodeCamp. It involves creating, modifying, and querying a PostgreSQL database for the periodic table of elements, as well as developing a Bash script to interact with the database and display element information.

## Features

- PostgreSQL database with tables for elements, properties, and element types
- Bash script (`element.sh`) that retrieves and displays element information based on user input
- Accepts atomic number, symbol, or element name as input
- Displays comprehensive information about the queried element
- Database modifications to improve structure and data integrity

## Technologies Used

- PostgreSQL
- Bash scripting
- Git for version control

## Project Structure

- `periodic_table/`: Main project directory (Git repository)
  - `element.sh`: Bash script for querying the database
  - `periodic_table.sql`: SQL dump of the database (not included in this repo)

## Setup and Usage

1. Ensure you have PostgreSQL installed on your system.
2. Clone this repository:

```
git clone https://github.com/your-username/periodic-table.git
cd periodic_table
```

3. Import the database (if you have the SQL dump):

```
psql -U postgres < periodic_table.sql
```

4. Make the script executable:

```
chmod +x element.sh
```

5. Run the script:

```
./element.sh [atomic_number|symbol|name]
```

## Example Usage

```
$ ./element.sh 1
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

$ ./element.sh Na
The element with atomic number 11 is Sodium (Na). It's a metal, with a mass of 22.99 amu. Sodium has a melting point of 97.8 celsius and a boiling point of 883 celsius.
```

## Detailed Project Tasks

This project involved completing the following tasks:

**Part 1: Fix the database**

1. Rename the `weight` column to `atomic_mass` in the properties table.
1. Rename `melting_point` and `boiling_point` columns to `melting_point_celsius` and `boiling_point_celsius` respectively.
1. Make `melting_point_celsius` and `boiling_point_celsius` columns `NOT NULL`.
1. Add the `UNIQUE` constraint to the `symbol` and `name` columns in the elements table.
1. Add the `NOT NULL` constraint to `symbol` and `name` columns.
1. Set the `atomic_number` column in the properties table as a `foreign key` that references the `elements` table.
1. Create a `types` table to store the three types of elements.
1. Add a `type_id` column to the types table as the `primary key`.
1. Add a `type` column to the types table `(VARCHAR, NOT NULL)`.
1. Populate the types table with the three different types from the properties table.
1. Add a `type_id` `foreign key` column to the properties table, referencing the `types` table.
1. Update each row in the properties table with the correct `type_id`.
1. Capitalize the first letter of all `symbol` values in the elements table.
1. Remove trailing zeros. after the decimals from each `atomic_mass` value.
1. Add Fluorine and Neon to the database with their respective properties.
1. Delete the non-existent element with atomic_number 1000 from both tables.

**Part 2: Create your git repository**

1. Create a `periodic_table` folder and initialize it as a `git` repository.
1. Make at least `five` commits with appropriate messages

**Part 3: Create the script**

1. Create an `element.sh` file in the repo folder
   Make the script executable.
1. Implement the script to accept an argument (atomic number, symbol, or name) and output element information
1. Handle cases where no argument is provided or the element is not found in the database.

**Script Functionality**
The `element.sh` script does the following:

1. Accepts an atomic number, symbol, or name of an element as an argument.
1. Queries the PostgreSQL database for the element's information.
1. Outputs formatted information about the element, including its atomic number, name, symbol, type, atomic mass, melting point, and boiling point.
1. Provides appropriate error messages for missing arguments or elements not found in the database.

**Git Commit Guidelines**
The project follows these commit message conventions:

1. Initial commit: "Initial commit"

Subsequent commits start with:

1. fix: for bug fixes
1. feat: for new features
1. refactor: for code refactoring
1. chore: for maintenance tasks
1. test: for adding or modifying tests

## Acknowledgements

freeCodeCamp for providing the project requirements and learning resource.

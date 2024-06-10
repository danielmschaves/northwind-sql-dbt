# Northwind SQL and DBT Project

This project aims to demonstrate expertise in database management, virtualization, and transformation by utilizing the Northwind database hosted on PostgreSQL. The Northwind database is a well-known sample database that captures sales transactions for a company that sells specialty foods worldwide. It includes data on orders, products, employees, and customers, making it ideal for illustrating business analytics, data modeling, and database design.

![ER Diagram](ER.png)

## Getting Started

### Manually

Use the provided SQL file `northwind.sql` to populate your database.

### With Docker and Docker Compose

#### Prerequisites: Install Git and Docker

- [Git](https://git-scm.com/downloads): To clone the repository.
- [Docker](https://www.docker.com/products/docker-desktop): To execute containers PostgreSQL, pgAdmin and dbt-core.

#### 1. Clone the Repository

Clone the project repository to get started with the setup:

```sh
git clone git@github.com:danielmschaves/northwind-sql-dbt.git
cd northwind-sql-dbt
```

#### 2. Execute Docker Containers

With Docker installed, navigate to the cloned project directory and execute the following command to start the containers:

```sh
docker-compose up --build
```

This will start the necessary containers: PostgreSQL, pgAdmin, and dbt-core.

#### 3. Access pgAdmin to View the Database

To access pgAdmin and view the data, open your browser and go to:

- URL: `http://localhost:5050/browser/`

Use the following credentials to connect to the database:

- **Host**: `db`
- **Porta**: `5432`
- **Database name**: `northwind`
- **User**: `postgres`
- **Password**: `postgres`

#### 4. Navigate to the Local Repository

Navigate to the local repository using the following command on terminal:

```sh
cd northwind
```

#### 5. Check dbt connection

Use the following command on terminal:

```sh
dbt debug
```

#### 6. Run dbt

Use the following command on terminal:

```sh
dbt run
```



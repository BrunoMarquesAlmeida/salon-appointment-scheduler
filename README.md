<!-- Please update value in the {}  -->

<h1 align="center">Salon Appointment Tracker</h1>

<div align="center">
   Solution for a challenge from <a href="https://www.freecodecamp.org" target="_blank">freecodecamp.org</a>.
</div>

<div align="center">
  <h3>
    <a href="https://www.freecodecamp.org/learn/relational-database/build-a-salon-appointment-scheduler-project/build-a-salon-appointment-scheduler">
      Challenge
    </a>
  </h3>
</div>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Overview](#overview)
  - [Built With](#built-with)
- [Features](#features)
- [How to use](#how-to-use)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- OVERVIEW -->

## Overview

![screenshot](https://github.com/BrunoMarquesAlmeida/salon-appointment-scheduler/blob/main/screenshot.jpg?raw=true)

This program was created as a submission to a [freeCodeCamp](https://www.freecodecamp.org) challenge. It is a part of the [Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/). The [challenge](https://www.freecodecamp.org/learn/relational-database/build-a-salon-appointment-scheduler-project/build-a-salon-appointment-scheduler) was to build a program to complete the following tasks:

- You should create a database named `salon`
- You should connect to your database, then create tables named `customers`, `appointments`, and `services`
- Each table should have a primary key column that automatically increments
- Each primary key column should follow the naming convention, `table_name_id`. For example, the `customers` table should have a `customer_id` key. Note that there’s no `s` at the end of `customer`
- Your `appointments` table should have a `customer_id` foreign key that references the `customer_id` column from the `customers` table
- Your `appointments` table should have a `service_id` foreign key that references the `service_id` column from the `services` table
- Your `customers` table should have `phone` that is a `VARCHAR` and must be unique~
- Your `customers` and `services` tables should have a `name` column
- Your `appointments` table should have a `time` column that is a `VARCHAR`
- You should have at least three rows in your `services` table for the different services you offer, one with a `service_id` of `1`
- You should create a script file named `salon.sh` in the `project` folder
- Your script file should have a “shebang” that uses bash when the file is executed (use `#! /bin/bash`)
- Your script file should have executable permissions
- You should not use the `clear` command in your script
- You should display a numbered list of the services you offer before the first prompt for input, each with the format `#) <service>`. For example, `1) cut`, where `1` is the `service_id`
- If you pick a service that doesn't exist, you should be shown the same list of services again
- Your script should prompt users to enter a `service_id`, phone number, a name if they aren’t already a customer, and a time. You should use `read` to read these inputs into variables named `SERVICE_ID_SELECTED`, `CUSTOMER_PHONE`, `CUSTOMER_NAME`, and `SERVICE_TIME`
- If a phone number entered doesn’t exist, you should get the customers name and enter it, and the phone number, into the `customers` table
- You can create a row in the `appointments` table by running your script and entering `1`, `555-555-5555`, `Fabio`, `10:30` at each request for input if that phone number isn’t in the `customers` table. The row should have the `customer_id` for that customer, and the `service_id` for the service entered
- You can create another row in the `appointments` table by running your script and entering `2`, `555-555-5555`, `11am` at each request for input if that phone number is already in the `customers` table. The row should have the `customer_id` for that customer, and the `service_id` for the service entered
- After an appointment is successfully added, you should output the message `I have put you down for a <service> at <time>, <name>.` For example, if the user chooses `cut` as the service, `10:30` is entered for the time, and their name is `Fabio` in the database the output would be `I have put you down for a cut at 10:30, Fabio.` Make sure your script finishes running after completing any of the tasks above, or else the tests won't pass

### Built With

<!-- This section should list any major frameworks that you built your project using. Here are a few examples.-->

- [PostgreSQL](https://www.postgresql.org/)
- [GNU Bash](https://www.gnu.org/software/bash/)

## How To Use

<!-- Example: -->

To clone and run this application, you'll need [PostgreSQL](https://www.postgresql.org/) and some way to run [GNU Bash](https://www.gnu.org/software/bash/) programs.
From your command line:

```bash
# Rebuild the database
psql -U postgres < salon.sql

# Then start salon.sh
./salon.sh
```

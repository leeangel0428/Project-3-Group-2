--Angel had to fix her sql tables and get rid of the FK stuff in order for code to run properly 10.23.2023

-- Dropping tables 

DROP TABLE annual_family_income;
DROP TABLE annual_house_price;
DROP TABLE annual_interest_rate;
DROP TABLE quarterly_house_price;
DROP TABLE quarterly_interest_rate;

-- Creating tables

CREATE TABLE "annual_family_income" (
    "year_quarter" VARCHAR   NOT NULL,
    "us_household_mean_income" INT   NOT NULL,
    "midwestern_household_mean_income" INT   NOT NULL,
    "northeastern_household_mean_income" INT   NOT NULL,
    "southern_household_mean_income" INT   NOT NULL,
    "western_household_mean_income" INT   NOT NULL
);

CREATE TABLE "annual_house_price" (
    "year_quarter" VARCHAR   NOT NULL,
    "southern_average_price" INT   NOT NULL,
    "western_average_price" INT   NOT NULL,
    "nationwide_average_price" INT   NOT NULL,
    "northeastern_average_price" INT   NOT NULL,
    "midwestern_average_price" INT   NOT NULL
);

CREATE TABLE "annual_interest_rate" (
    "year_quarter" VARCHAR   NOT NULL,
    "fixed_30_year_rate" DECIMAL   NOT NULL
);

CREATE TABLE "quarterly_house_price" (
    "year_quarter" VARCHAR   NOT NULL,
    "southern_average_price" INT   NOT NULL,
    "western_average_price" INT   NOT NULL,
    "nationwide_average_price" INT   NOT NULL,
    "northeastern_average_price" INT   NOT NULL,
    "midwestern_average_price" INT   NOT NULL,
    CONSTRAINT "pk_quarterly_house_price" PRIMARY KEY (
        "year_quarter"
     )
);

CREATE TABLE "quarterly_interest_rate" (
    "year_quarter" VARCHAR   NOT NULL,
    "fixed_30_year_rate" DECIMAL   NOT NULL
);

-- Manual importing of data 

-- Checking to see that everything loaded correctly

SELECT * FROM annual_family_income;
SELECT * FROM annual_house_price;
SELECT * FROM annual_interest_rate;
SELECT * FROM quarterly_house_price;
SELECT * FROM quarterly_interest_rate;

-- Code to check PKs/FKs

SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='annual_family_income'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='annual_house_price'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='annual_interest_rate'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='quarterly_house_price'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='quarterly_interest_rate'

-- Cleaning data so we don't have Q1 or Q2 in our annual data tables

UPDATE annual_family_income
SET year_quarter = SUBSTRING(year_quarter, 1, 4);

UPDATE annual_house_price
SET year_quarter = SUBSTRING(year_quarter, 1, 4);

UPDATE annual_interest_rate
SET year_quarter = SUBSTRING(year_quarter, 1, 4);
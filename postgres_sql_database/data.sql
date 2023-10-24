-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/ then edited by Angel L. to fix "no unique constraint error".
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

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

--This is normally where imported the data manually into the tables

--Altering tables to add constraints/relationships, PKs, FKs

ALTER TABLE "quarterly_house_price" ADD CONSTRAINT "pk_quarterly_house_price" PRIMARY KEY ("year_quarter");

ALTER TABLE "annual_family_income" ADD CONSTRAINT "fk_annual_family_income_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "quarterly_house_price" ("year_quarter");

ALTER TABLE "annual_house_price" ADD CONSTRAINT "fk_annual_house_price_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "quarterly_house_price" ("year_quarter");

ALTER TABLE "annual_interest_rate" ADD CONSTRAINT "fk_annual_interest_rate_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "quarterly_house_price" ("year_quarter");

ALTER TABLE "quarterly_interest_rate" ADD CONSTRAINT "fk_quarterly_interest_rate_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "quarterly_house_price" ("year_quarter");

--viewing tables

SELECT * FROM "annual_family_income" LIMIT 5;
SELECT * FROM "annual_house_price" LIMIT 5;
SELECT * FROM "annual_interest_rate" LIMIT 5;
SELECT * FROM "quarterly_house_price" LIMIT 5;
SELECT * FROM "quarterly_interest_rate" LIMIT 5;

--wasn't able to see the FKs in the tables
--asked collegue (P.S.) for assistance and he suggested using INFORMATION_SCHEMA.KEY_COLUMN_USAGE
--it finds details about key columns that are part of foreign key constraints in the specified table

SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='annual_family_income'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='annual_house_price'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='annual_interest_rate'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='quarterly_house_price'
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='quarterly_interest_rate'

--Unfortunately, we ran into a hurdle when creating our visualizations. We needed our years not to include "Q1" and "Q2"
--The code below allows us to do so but in order to do that, we had to drop constraints for the three annual data tables
--This also causes issues in the ERD/relationships bc the values are now different
    
UPDATE annual_family_income
SET year_quarter = SUBSTRING(year_quarter, 1, 4);

UPDATE annual_house_price
SET year_quarter = SUBSTRING(year_quarter, 1, 4);

UPDATE annual_interest_rate
SET year_quarter = SUBSTRING(year_quarter, 1, 4);

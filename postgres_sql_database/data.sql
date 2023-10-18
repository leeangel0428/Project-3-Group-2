-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/ then edited by Angel L. to fix "no unique constraint error".
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


--Creating tables before importing data

CREATE TABLE "annual_family_income" (
    "year_quarter" VARCHAR(100) NOT NULL,
    "us_household_mean_income" INT   NOT NULL,
    "midwestern_household_mean_income" INT   NOT NULL,
    "northeastern_household_mean_income" INT   NOT NULL,
    "southern_household_mean_income" INT   NOT NULL,
    "western_household_mean_income" INT   NOT NULL,
    CONSTRAINT "pk_annual_family_income" PRIMARY KEY (
        "year_quarter"
     )
);

CREATE TABLE "annual_house_price" (
    "year_quarter" VARCHAR(100)   NOT NULL,
    "southern_average_price" INT   NOT NULL,
    "western_average_price" INT   NOT NULL,
    "nationwide_average_price" INT   NOT NULL,
    "northeastern_average_price" INT   NOT NULL,
    "midwestern_average_price" INT   NOT NULL
);

CREATE TABLE "annual_interest_rate" (
    "year_quarter" VARCHAR(100)   NOT NULL,
    "fixed_30_year_rate" DECIMAL   NOT NULL
);

CREATE TABLE "quarterly_house_price" (
    "year_quarter" VARCHAR(100)   NOT NULL,
    "southern_average_price" INT   NOT NULL,
    "western_average_price" INT   NOT NULL,
    "nationwide_average_price" INT   NOT NULL,
    "northeastern_average_price" INT   NOT NULL,
    "midwestern_average_price" INT   NOT NULL
);

CREATE TABLE "quarterly_interest_rate" (
    "year_quarter" VARCHAR(100)   NOT NULL,
    "fixed_30_year_rate" DECIMAL   NOT NULL
);

--Altered tables w constraints but then couldn't import data, so we then had to drop them

ALTER TABLE "annual_family_income" DROP CONSTRAINT "pk_annual_family_income";

ALTER TABLE "annual_house_price" ADD CONSTRAINT "fk_annual_house_price_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "annual_interest_rate" ADD CONSTRAINT "fk_annual_interest_rate_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "quarterly_house_price" ADD CONSTRAINT "fk_quarterly_house_price_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "quarterly_interest_rate" ADD CONSTRAINT "fk_quarterly_interest_rate_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "annual_house_price" DROP CONSTRAINT "fk_annual_house_price_year_quarter"

ALTER TABLE "annual_interest_rate" DROP CONSTRAINT "fk_annual_interest_rate_year_quarter"

ALTER TABLE "quarterly_house_price" DROP CONSTRAINT "fk_quarterly_house_price_year_quarter"

ALTER TABLE "quarterly_interest_rate" DROP CONSTRAINT "fk_quarterly_interest_rate_year_quarter"

--Altering tables to add relationships, PKs, FKs

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



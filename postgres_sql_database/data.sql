-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/ then edited by Angel L. to fix "no unique constraint error".
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "annual_family_income" (
    "year_quarter" INT   NOT NULL,
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
    "year_quarter" INT   NOT NULL,
    "southern_average_price" INT   NOT NULL,
    "western_average_price" INT   NOT NULL,
    "nationwide_average_price" INT   NOT NULL,
    "northeastern_average_price" INT   NOT NULL,
    "midwestern_average_price" INT   NOT NULL
);

CREATE TABLE "annual_interest_rate" (
    "year_quarter" INT   NOT NULL,
    "fixed_30_year_rate" FLOAT   NOT NULL
);

CREATE TABLE "quarterly_house_price" (
    "year_quarter" INT   NOT NULL,
    "southern_average_price" INT   NOT NULL,
    "western_average_price" INT   NOT NULL,
    "nationwide_average_price" INT   NOT NULL,
    "northeastern_average_price" INT   NOT NULL,
    "midwestern_average_price" INT   NOT NULL
);

CREATE TABLE "quarterly_interest_rate" (
    "year_quarter" INT   NOT NULL,
    "fixed_30_year_rate" FLOAT   NOT NULL
);

ALTER TABLE "annual_house_price" ADD CONSTRAINT "fk_annual_house_price_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "annual_interest_rate" ADD CONSTRAINT "fk_annual_interest_rate_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "quarterly_house_price" ADD CONSTRAINT "fk_quarterly_house_price_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");

ALTER TABLE "quarterly_interest_rate" ADD CONSTRAINT "fk_quarterly_interest_rate_year_quarter" FOREIGN KEY("year_quarter")
REFERENCES "annual_family_income" ("year_quarter");


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "annual_family_income" (
    "Year_Quarter" INT   NOT NULL,
    "US_Household_Mean_Income" INT   NOT NULL,
    "Midwestern_Household_Mean_Income" INT   NOT NULL,
    "Northeastern_Household_Mean_Income" INT   NOT NULL,
    "Southern_Household_Mean_Income" INT   NOT NULL,
    "Western_Household_Mean_Income" INT   NOT NULL,
    CONSTRAINT "pk_annual_family_income" PRIMARY KEY (
        "Year_Quarter"
     )
);

CREATE TABLE "annual_house_price" (
    "Year_Quarter" INT   NOT NULL,
    "Southern_Average_Price" INT   NOT NULL,
    "Western_Average_Price" INT   NOT NULL,
    "Nationwide_Average_Price" INT   NOT NULL,
    "Northeastern_Average_Price" INT   NOT NULL,
    "Midwestern_Average_Price" INT   NOT NULL
);

CREATE TABLE "annual_interest_rate" (
    "Year_Quarter" INT   NOT NULL,
    "Fixed_30_year_Rate" FLOAT   NOT NULL
);

CREATE TABLE "quarterly_house_price" (
    "Year_Quarter" INT   NOT NULL,
    "Southern_Average_Price" INT   NOT NULL,
    "Western_Average_Price" INT   NOT NULL,
    "Nationwide_Average_Price" INT   NOT NULL,
    "Northeastern_Average_Price" INT   NOT NULL,
    "Midwestern_Average_Price" INT   NOT NULL
);

CREATE TABLE "quarterly_interest_rate" (
    "Year_Quarter" INT   NOT NULL,
    "Fixed_30_year_Rate" FLOAT   NOT NULL
);

ALTER TABLE "annual_house_price" ADD CONSTRAINT "fk_annual_house_price_Year_Quarter" FOREIGN KEY("Year_Quarter")
REFERENCES "annual_family_income" ("Year_Quarter");

ALTER TABLE "annual_interest_rate" ADD CONSTRAINT "fk_annual_interest_rate_Year_Quarter" FOREIGN KEY("Year_Quarter")
REFERENCES "annual_family_income" ("Year_Quarter");

ALTER TABLE "quarterly_house_price" ADD CONSTRAINT "fk_quarterly_house_price_Year_Quarter" FOREIGN KEY("Year_Quarter")
REFERENCES "annual_house_price" ("Year_Quarter");

ALTER TABLE "quarterly_interest_rate" ADD CONSTRAINT "fk_quarterly_interest_rate_Year_Quarter" FOREIGN KEY("Year_Quarter")
REFERENCES "annual_interest_rate" ("Year_Quarter");


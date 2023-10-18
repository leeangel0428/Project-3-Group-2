# Introduction:

Hello and welcome to Group 2's submission for Project 3. Our group consists of Angel Lee, Clover McLaughlin, Jake Moen, Rae Mcallister, Matthew Byron. For context, at the time of writing this, we are enrolled in the Data Analytics and Visualizations bootcamp with the University of MN. in this repo, you will find the Resources folder, statis folder, Data cleaning jupyter notebook file, and the index.html file. The Resources folder contains the raw data from FRED. The static folder contains two folders, the css folder containing the "style.css" file and the js folder containing the "logic.js" file. 

# Challenge Requirements: 

We had the freedom of choosing our topic so long as our project includes all of the following:

1. Must include: Python Flask-powered API, HTML/CSS, JavaScript, and at least one database (SQL, MongoDB, SQLite, etc.). 
2. Your project should fall into one of the below four tracks:
○ A combination of web scraping and Leaflet or Plotly 
○ A dashboard page with multiple charts that update from the same data 
4. At least one JS library that we did not cover. 
5. Powered by a dataset with at least 100 records. 
6. Some level of user-driven interaction, such as menus, dropdowns, and textboxes. 
7. If possible, your final visualization should include at least three views. 

# Project: "USA Cost of Homes, Mortgage Rates, and Average Household Income in the Past 50 Years"

### Description: 
The aim of this project is to uncover patterns between the cost of homes in the US, their interest rates, and the average household income within the past 50 years.

### Overarching Questions: 

1. What is the relationship between US cost of homes and the interest rates?
2. What is the relationship between US average household income and US cost of homes?
3. What is the % of the avg household income needed to afford the avg mortgage payment?

### Hypotheses:

1. As the interest rates decrease, the cost of a home increases. 
2. As the average household income increases, the cost of homes increases.
3. 28% of the average household income is needed to cover the mortgage payments.

# Trouble Shooting:

1. Forgot to drop indexes while reading csv files into jupyter notebook so we later on had to switch and drop them before creating new csv files with the cleaned data.
2. Assigned incorrect PKs and FKs to sql ERD which later caused importing errors and table update errors in the Postgres SQL database. Had to correct those and alter tables accordingly.


# Resources/ Citations:

Aside from the sources cited below, everything used was retained information gathered from classes and class activities. As always shout out to our bootcamp TAs Sam and Randy for all their help answering our questions during office hours, our instructor Hunter for always being clear in his articulation of the course material, and our colleagues (notably Parker Shimek) for their encouragement and support.

Chase. (n.d). "What percentage of your income should go towards your mortgage". JPMorgan Chase & Co. Retrieved from: https://www.chase.com/personal/mortgage/education/financing-a-home/what-percentage-income-towards-mortgage

Flask. (n.d). “Templates”. Pallets. Retrieved from: https://flask.palletsprojects.com/en/2.3.x/templating/#jinja-setup

FRED. (n.d). "30-Year Fixed Rate Mortgage Average in the United States". Federal Reserve Bank of St. Louis. Retrieved from: https://fred.stlouisfed.org/series/MORTGAGE30US

FRED. (n.d). "Average Sales Price of Houses Sold for the United States". Federal Reserve Bank of St. Louis. Retrieved from: https://fred.stlouisfed.org/series/ASPUS

FRED. (n.d). "Mean Family Income in the United States". Federal Reserve Bank of St. Louis. Retrieved from: https://fred.stlouisfed.org/series/MAFAINUSA646N 

Grinberg, M. (2017, December 12th). “The Flask Mega-Tutorial Part II: Templates”. Miguelgrinberg.com. Retrieved from: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-ii-templates

Multiple Contributors (https://github.com/chartjs/Chart.js/graphs/contributors). (nd). “Chart.js”. Retrieved from: https://www.chartjs.org/

SlidesGo. (n.d). “Rental Housing Marketing Plan”. Freepik Company S.L. Retrieved from: https://slidesgo.com/theme/rental-housing-marketing-plan#search-housing&position-8&results-69&rs=search

Wikipedia. (2022, December 3rd). “Lodash”. Wikipedia Foundation, Inc. Retrieved from: https://en.wikipedia.org/wiki/Lodash

Wikipedia. (2023, September 27th). “Charts.js”. Wikipedia Foundation, Inc. Retrieved from: https://en.wikipedia.org/wiki/Chart.js

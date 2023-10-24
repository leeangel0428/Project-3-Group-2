# Introduction:

Hello and welcome to Group 2's submission for Project 3. Our group consists of Angel Lee, Clover McLaughlin, Jake Moen, RaeShawn Mcallister, Matthew Byron. For context, at the time of writing this, we are enrolled in the Data Analytics and Visualizations bootcamp with the University of MN.

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

# In this REPO:
1. Project 3, Group 2- Presentation.pdf
2. Data_cleaning.ipynb: jupyter ntoebook used to clean raw data from FRED
3. app.py: python file used to grab postgres sql data and create the main and data webpages
4. extra.text: text file to hold multiple different codes we tried while trouble shooting/working on project in general
5. US region info.json: json file that holds the US regions, intended to use this to create map visualization but we did not have enough time
6. jsonifyoutput.text: text file used to hold the jsonified data output on our data webpage
7. Resources folder: holds the original csv files downloaded from FRED
8. clean_data_outputs folder: holds the cleaned data from jupyter notebook
9. postgres_sql_database folder: holds the schema used to create the ERD, the ERD, the data.sql file that contains sql code we used to create/import/alter tables and and clean values
10. static folder: contains the css folder that holds the style.css file and the js folder that holds the logic.js file
11. templates folder: contains the index.html file

# Visualizations:

### ERD (Entity-relationship Diagram):

![erd_final_image](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/c33ed1ae-36bd-4fca-96f8-58d8a00fbace)

### Map Visual:

![regions-image](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/7f9afd95-3fcd-430f-bd96-78ddcdcb4b0e)

### Main Webpage: 

![Screenshot 2023-10-23 181942](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/74c70f63-7bb3-4e64-8281-b15b2a85ab3b)

![Screenshot 2023-10-23 181948](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/a2fa39dc-072f-49fc-b829-5a380c4640d8)

![Screenshot 2023-10-23 181931](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/d0c268e6-75a9-4558-b9b2-1b092b7d9738)

### Line Graphs Changing by Region:

![US-line](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/3faf32d1-1fc0-412e-85a8-e4581f2f4ec5)

![Midwest-line](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/c3ad1e2c-a5cf-4aa8-bcce-895da7ba04ff)

![South-line](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/2672901e-2336-4868-84f4-02bedc2f077f)

![Northeast-line](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/b1f97d7b-13f8-4a4c-9610-adb26343d851)

![West-line](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/1781f45c-9f25-4399-b6ca-f50a46078938)

### Bar Graph for Interest Rates:

![interest-rate-bar](https://github.com/leeangel0428/Crowdfunding_ETL/assets/137225965/10d5475f-3e0f-4baf-a99d-90babd266c40)

# Limitations:
1. Unable to calculate accurate annual data for house prices and interest rates so we
2. Took quarter 2 values to represent the referenced years
3. Unable to add a line graph to visually compare US house prices, interest rates, and family income
4. Jupyter Notebook Cleaning:
5. Original data was in Dates (01/01/1975) but we
6. Converted Dates to show YearQuarter (1975Q1) which lead to sql issues and visualization issues with
7. PostGresQL ERD/FKs and PKs
8. Cleaned year_quarter values to remove “Q1” and “Q2” which skewed the ERD and FK constraints
9. ERD appears correct despite being unable to adjust them in PostGres due to the actual values being changes
10. Did not have enough time to use incorporate new js library
11. Originally had a third question we wanted to use a pie chart for but didn’t have enough time to make manual calculations/create visualization

# Resources/ Citations:

Aside from the sources cited below, everything used was retained information gathered from classes and class activities. As always shout out to our bootcamp TAs Sam and Randy for all their help answering our questions during office hours, our instructor Hunter for always being clear in his articulation of the course material, and our colleagues (notably Parker Shimek and Anthony Wells) for their encouragement and support.

Base64 Image. (n.d.). "Convert Your Images to Base64". Awesome Bonn UG. Retrieved from: https://www.base64-image.de/

Chase. (n.d). "What percentage of your income should go towards your mortgage". JPMorgan Chase & Co. Retrieved from: https://www.chase.com/personal/mortgage/education/financing-a-home/what-percentage-income-towards-mortgage

Flask. (n.d). “Templates”. Pallets. Retrieved from: https://flask.palletsprojects.com/en/2.3.x/templating/#jinja-setup

FRED. (n.d). "30-Year Fixed Rate Mortgage Average in the United States". Federal Reserve Bank of St. Louis. Retrieved from: https://fred.stlouisfed.org/series/MORTGAGE30US

FRED. (n.d). "Average Sales Price of Houses Sold for the United States". Federal Reserve Bank of St. Louis. Retrieved from: https://fred.stlouisfed.org/series/ASPUS

FRED. (n.d). "Mean Family Income in the United States". Federal Reserve Bank of St. Louis. Retrieved from: https://fred.stlouisfed.org/series/MAFAINUSA646N 

Grinberg, M. (2017, December 12th). “The Flask Mega-Tutorial Part II: Templates”. Miguelgrinberg.com. Retrieved from: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-ii-templates

Leaflet. (n.d.). "Interactive Chroropleth Map". Leaflet. Retrieved from: https://leafletjs.com/examples/choropleth/

Multiple Contributors (https://github.com/chartjs/Chart.js/graphs/contributors). (nd). “Chart.js”. Retrieved from: https://www.chartjs.org/

Salman, T. (2017, March 16th). "HTML5 CSS 3- Container and Div- How to work within Container and Div". YouTube. Retrieved from: https://www.youtube.com/watch?v=iwz8YazPKZE&ab_channel=TanveerSalman

SlidesGo. (n.d). “Rental Housing Marketing Plan”. Freepik Company S.L. Retrieved from: https://slidesgo.com/theme/rental-housing-marketing-plan#search-housing&position-8&results-69&rs=search

SparkByExamples. (2023, January 29th). "Convert Python List to JSON Examples" SparkByExamples: One Stop for all Code Examples. Retrieved from: https://sparkbyexamples.com/python/convert-python-list-to-json/

Wikipedia. (2022, December 3rd). “Lodash”. Wikipedia Foundation, Inc. Retrieved from: https://en.wikipedia.org/wiki/Lodash

Wikipedia. (2023, September 27th). “Charts.js”. Wikipedia Foundation, Inc. Retrieved from: https://en.wikipedia.org/wiki/Chart.js

Y.,D. (2023, March 15th). "Use global variables in Python functions". Sentry. Retrieved from: "https://sentry.io/answers/use-global-variables-in-python-functions/"


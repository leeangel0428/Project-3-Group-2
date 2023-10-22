#Imports
from flask import Flask, render_template
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func, select, text
from flask import Flask, jsonify
import json

## create engine
url = "postgresql://postgres:postgres@localhost/project3"
engine = create_engine(url)
connection = engine.connect()

## Flask variable
app = Flask(__name__)

# creating dictionary that will store response data
response_data= {}

@app.route('/data')

def function1():
    #made this a global variable so we can use it in the second function as well
    global response_data

    region_list= ["United States", "Midwest", "South", "Northeast", "West"]
    response_data['regions']= region_list

    query1= text('SELECT * FROM annual_family_income')
    afi_results = connection.execute(query1)
    annual_family_income_key= []
    for row in afi_results:
        afi_result_dict = {
            "year_quarter": row[0],
            "us_household_mean_income": row[1],
            "midwestern_household_mean_income": row[2],
            "southern_household_mean_income": row[3],
            "northeastern_household_mean_income": row[4],
            "western_household_mean_income": row[5]
        }
        annual_family_income_key.append(afi_result_dict)
    response_data['annual_family_income']= annual_family_income_key
    afixValues = []
    afi_south_yValues = []
    afi_west_yValues= []
    afi_us_yValues= []
    afi_ne_yValues= []
    afi_mw_yValues= []
    for row in response_data['annual_family_income']:
        afixValues.append(row['year_quarter'])
        afi_south_yValues.append(row['southern_household_mean_income'])
        afi_west_yValues.append(row['western_household_mean_income'])
        afi_us_yValues.append(row['us_household_mean_income'])
        afi_ne_yValues.append(row['northeastern_household_mean_income'])
        afi_mw_yValues.append(row['midwestern_household_mean_income'])

    query2= text('SELECT * FROM annual_house_price')
    ahp_results = connection.execute(query2)
    annual_house_price_key = []
    for row in ahp_results:
        ahp_result_dict = {
            "year_quarter": row[0],
            "southern_household_mean_income": row[1],
            "western_household_mean_income": row[2],
            "us_household_mean_income": row[3],
            "northeastern_household_mean_income": row[4],
            "midwestern_household_mean_income": row[5]
        }
        annual_house_price_key.append(ahp_result_dict)
    response_data["annual_house_price"] = annual_house_price_key
    ahpxValues = []
    ahp_south_yValues = []
    ahp_west_yValues= []
    ahp_us_yValues= []
    ahp_ne_yValues= []
    ahp_mw_yValues= []
    for row in response_data['annual_house_price']:
        ahpxValues.append(row['year_quarter'])
        ahp_south_yValues.append(row['southern_household_mean_income'])
        ahp_west_yValues.append(row['western_household_mean_income'])
        ahp_us_yValues.append(row['us_household_mean_income'])
        ahp_ne_yValues.append(row['northeastern_household_mean_income'])
        ahp_mw_yValues.append(row['midwestern_household_mean_income'])

    query3= text('SELECT * FROM quarterly_house_price')
    qhp_results = connection.execute(query3)
    quarterly_house_price_key = []
    for row in qhp_results:
        qhp_result_dict = {
            "year_quarter": row[0],
            "southern_household_mean_income": row[1],
            "western_household_mean_income": row[2],
            "us_household_mean_income": row[3],
            "northeastern_household_mean_income": row[4],
            "midwestern_household_mean_income": row[5]
        }
        quarterly_house_price_key.append(qhp_result_dict)
    response_data['quarterly_house_price']= quarterly_house_price_key

    query4= text('SELECT * FROM annual_interest_rate')
    air_results = connection.execute(query4)
    annual_interest_rate_key = []
    for row in air_results:
        air_result_dict = {
            "year_quarter": row[0],
            "fixed_30_year_rate": row[1]
        }
        annual_interest_rate_key.append(air_result_dict)
    response_data['annual_interest_rate']= annual_interest_rate_key
    airxValues = []
    airyValues = []
    for row in response_data['annual_interest_rate']:
        airxValues.append(row['year_quarter'])
        airyValues.append(row['fixed_30_year_rate'])

    query5= text('SELECT * FROM quarterly_interest_rate')
    qir_results = connection.execute(query5)
    quarterly_interest_rate_key = []
    for row in qir_results:
        qir_result_dict = {
            "year_quarter": row[0],
            "fixed_30_year_rate": row[1]
        }
        quarterly_interest_rate_key.append(qir_result_dict)
    response_data['quarterly_interest_rate']= quarterly_interest_rate_key

#attempt to create lists to look like example but doesn't work
    response_data['data_list']= [
        afixValues,
        afi_south_yValues,
        afi_west_yValues,
        afi_us_yValues,
        afi_ne_yValues,
        afi_mw_yValues,
        ahpxValues,
        ahp_south_yValues,
        ahp_west_yValues,
        ahp_us_yValues,
        ahp_ne_yValues,
        ahp_mw_yValues,
        airxValues,
        airyValues
    ]

    #return jsonify(response_data), 
    return response_data

@app.route('/')
def index():
    # to check response
    functionOutputs=function1()
    

    return render_template('index.html', data= functionOutputs)

def close_connection():
    connection.close()

## running Flask
if __name__ == "__main__":
    app.run(debug=True)

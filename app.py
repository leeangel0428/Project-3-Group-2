#Imports
from flask import Flask, render_template
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func, select, text
from flask import Flask, jsonify
import json

## create engine
url = "postgresql://postgres:postgres@localhost:5432/Project3"
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
            "United States": row[1],
            "Midwest": row[2],
            "South": row[3],
            "Northeast": row[4],
            "West": row[5]
        }
        annual_family_income_key.append(afi_result_dict)
    response_data['annual_family_income']= annual_family_income_key

    query2= text('SELECT * FROM annual_house_price')
    ahp_results = connection.execute(query2)
    annual_house_price_key = []
    for row in ahp_results:
        ahp_result_dict = {
            "year_quarter": row[0],
            "South": row[1],
            "West": row[2],
            "United States": row[3],
            "Northeast": row[4],
            "Midwest": row[5]
        }
        annual_house_price_key.append(ahp_result_dict)
    response_data["annual_house_price"] = annual_house_price_key

    query3= text('SELECT * FROM quarterly_house_price')
    qhp_results = connection.execute(query3)
    quarterly_house_price_key = []
    for row in qhp_results:
        qhp_result_dict = {
            "year_quarter": row[0],
            "South": row[1],
            "West": row[2],
            "United States": row[3],
            "Northeast": row[4],
            "Midwest": row[5]
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

    return jsonify(response_data)

@app.route('/')
def index():
    # to check response
    function=function1()

    return render_template('index.html', data= function)

@app.route('/test')
def test():
    return ({"test": "hello"})


def close_connection():
    connection.close()

## running Flask
if __name__ == "__main__":
    app.run(debug=True)

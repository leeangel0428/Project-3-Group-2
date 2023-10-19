from flask import Flask, render_template
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, jsonify

## create engine
url = "postgresql://postgres:postgres@localhost/Project_3_Group_2"
engine = create_engine(url)
connection = engine.connect()
## Base = automap_base()
## Base.prepare(autoload_with = engine)
# result = connection.execute("SELECT * FROM annual_family_income")
# for row in result: 
#     print (row)

## define function to call table from sql
def call_table(select_table):
    list1 = []
    list = []
    results = connection.execute(select_table)
    annual_family_income_result = []
    for row in results:
        result_dict = {}
        result_dict["year_quarter"] = row[0]
        result_dict["us_household_mean_income"] = row[1]
        result_dict["midwestern_household_mean_income"] = row[2]
        result_dict["southern_household_mean_income"]= row[3]
        result_dict["northeastern_household_mean_income"]= row[4]
        result_dict["western_household_mean_income"]= row[5]
        annual_family_income_result.append(result_dict )
    return jsonify(annual_family_income_result)
    # data = jsonify(annual_family_income_result)
    # print(data)
    # return

    ## for result in results:
        ## print(result)
        ## list.append(result)
        ## for index in range(len(list)):
            ## list1.append(list[index][0])
    ## print (list1)
    ## return

## call_table("SELECT * FROM annual_family_income")

## Flask variable
app = Flask(__name__)

## app.py
# @app.route('/')
# def plot_values():
#     ## replace next line with whatever data you need from your database
#     ## x_values = 
#     ## y_values = 
#     data = {'x_values': [1, 2, 3, 4, 5], 'y_values': [1, 4, 9, 16, 25]}
#     return render_template('index.html', data=data)

@app.route('/')
def index():
    table_afi = call_table("SELECT * FROM annual_family_income")
    table_ai = 
    # print(table)
    return render_template('index.html', afi=table_afi)

## running Flask
if __name__ == "__main__":
    app.run(debug=True)

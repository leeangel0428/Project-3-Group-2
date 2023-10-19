from flask import Flask, render_template
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, jsonify

## create engine
url = "postgresql://leeangel0428:postgres@localhost/project3"
engine = create_engine(url)
Base = automap_base()
Base.prepare(autoload_with = engine)

## Flask variable
app = Flask(__name__)

## app.py
@app.route('/')
def plot_values():
    ## replace next line with whatever data you need from your database
    data = {'x_values': [1, 2, 3, 4, 5], 'y_values': [1, 4, 9, 16, 25]}
    return render_template('index.html', data=data)

## running Flask
if __name__ == "__main__":
    app.run(debug=True)

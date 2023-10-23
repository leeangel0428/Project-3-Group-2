const url = "http://127.0.0.1:5000/data"

// Promise
const dataPromise = d3.json(url);
console.log("Data Promise: ", dataPromise);

// Obtain Json data and console log
d3.json(url).then(function (data) {
    console.log(data);
});


//Initialize to get data from url
function init() {
    let dropdownMenu = d3.select("#selDataset");
    d3.json(url).then((data) => {
        let regions = data.regions;
        regions.forEach((region) => {
            console.log(region);
            dropdownMenu.append("option").text(region).property("value", region);
        });

        // let default_sample = names[0];
        //         horizontalBar_chart(default_sample);
        //         bubble_chart(default_sample);
        // createRegionInfo(default_sample)
    })
};

function optionChanged(selectedRegion) {

    console.log(selectedRegion);

    createLineChart(selectedRegion);

}

//Creating function to grab x and y values for graphs and making sure they change based on region chosen
function createLineChart(region) {
    d3.json(url).then((data) => {
        let annual_family_income_regionValues = data.annual_family_income
        let annual_family_income_yValues = []
        let annual_family_income_xValues = []
        for (let index = 0; index < annual_family_income_regionValues.length; index++) {
            let annual_family_income_y = annual_family_income_regionValues[index][region]
            annual_family_income_yValues.push(annual_family_income_y)
            let annual_family_income_x = annual_family_income_regionValues[index]['year_quarter']
            annual_family_income_xValues.push(annual_family_income_x)
        }
        console.log(annual_family_income_xValues)
        console.log(annual_family_income_yValues)

        let annual_house_price_regionValues = data.annual_house_price
        let annual_house_price_yValues = []
        let annual_house_price_xValues = []
        for (let index = 0; index < annual_house_price_regionValues.length; index++) {
            let annual_house_price_y = annual_house_price_regionValues[index][region]
            annual_house_price_yValues.push(annual_house_price_y)
            let annual_house_price_x = annual_house_price_regionValues[index]['year_quarter']
            annual_house_price_xValues.push(annual_house_price_x)
        }
        console.log(annual_house_price_xValues)
        console.log(annual_house_price_yValues)

//Creating traces in order to graph annual_family_income and annual house price 
        var trace1 = {
            x: annual_family_income_xValues, 
            y: annual_family_income_yValues, 
            type: 'scatter',
            mode: 'line',
            name: 'Family Income'
        };
        var trace2 = {
            x: annual_house_price_xValues, 
            y: annual_house_price_yValues, 
            type: 'line+marker',
            name: 'House Price'
        };

        var data = [trace1, trace2];
        var layout = {
            title: "Changes of House Price and Family Income annually (1975 - 2022)",
            xaxis: {title: 'Year'},
            yaxis: {title: 'House Price/Family Income'},
            autosize: false,
        }
        Plotly.newPlot('line_graph', data, layout);
    })
};


//run init function
init()

//Creating the map

let myMap = L.map("map", {
    center: [37.09, -95.71],
    zoom: 5
});

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(myMap);

s
function color(region) {
    return region === 'United States'
}

function test() {
    var data = {
        labels: ['Category 1', 'Category 2', 'Category 3', 'Category 4', 'Category 5'],
        datasets: [{
          label: 'Sample Data',
          data: [10, 20, 15, 30, 25],
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      };

    Var ctx = document.getElementById('myBarChart').getContext('2d');
    var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: {}
    });
}

test()


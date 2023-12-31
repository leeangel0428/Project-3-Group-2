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
    createAreaGraph()
    let dropdownMenu = d3.select("#selDataset");
    d3.json(url).then((data) => {
        let regions = data.regions;
        regions.forEach((region) => {
            console.log(region);
            dropdownMenu.append("option").text(region).property("value", region);
        });
    
        let default_region = "United States"

        createLineChart(default_region);

        createline_graph2(default_region);

        createAreaGraph2()
    })
};

function optionChanged(selectedRegion) {

    console.log(selectedRegion);

    createLineChart(selectedRegion);

    createline_graph2(selectedRegion)

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
        // console.log(annual_family_income_xValues)
        // console.log(annual_family_income_yValues)

        let annual_house_price_regionValues = data.annual_house_price
        let annual_house_price_yValues = []
        let annual_house_price_xValues = []
        for (let index = 0; index < annual_house_price_regionValues.length; index++) {
            let annual_house_price_y = annual_house_price_regionValues[index][region]
            annual_house_price_yValues.push(annual_house_price_y)
            let annual_house_price_x = annual_house_price_regionValues[index]['year_quarter']
            annual_house_price_xValues.push(annual_house_price_x)
        }
        // console.log(annual_house_price_xValues)
        // console.log(annual_house_price_yValues)

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

function createline_graph2(region) {
    d3.json(url).then((data) => {
        // let quarterly_interest_rate = data.quarterly_interest_rate

        // let quarterly_interest_rate_yValues = []
        // let quarterly_interest_rate_xValues = []
        // for (let index = 0; index < quarterly_interest_rate.length; index++) {
        //     console.log(quarterly_interest_rate[index]['fixed_30_year_rate'])
        //     let quarterly_interest_rate_y = quarterly_interest_rate[index]['fixed_30_year_rate']
        //     quarterly_interest_rate_yValues.push(quarterly_interest_rate_y)
        //     let quarterly_interest_rate_x = quarterly_interest_rate[index]['year_quarter']
        //     quarterly_interest_rate_xValues.push(quarterly_interest_rate_x)
        // }


        let quarterly_house_price_regionValues = data.quarterly_house_price
        let quarterly_house_price_yValues = []
        let quarterly_house_price_xValues = []
        for (let index = 0; index < quarterly_house_price_regionValues.length; index++) {
            let quarterly_house_price_y = quarterly_house_price_regionValues[index][region]
            quarterly_house_price_yValues.push(quarterly_house_price_y)
            let quarterly_house_price_x = quarterly_house_price_regionValues[index]['year_quarter']
            quarterly_house_price_xValues.push(quarterly_house_price_x)
        }

          
        // var trace1 = {
        //     x: quarterly_interest_rate_xValues, 
        //     y: quarterly_interest_rate_yValues, 
        //     type: 'scatter',
        //     mode: 'line',
        //     name: 'Quarterly Interest Rate'
        // };

        var trace2 = {
            x: quarterly_house_price_xValues, 
            y: quarterly_house_price_yValues, 
            type: 'scatter',
            mode: 'line',
            name: 'Quarterly House Price'
        };
        
        var data = [trace2];
        var layout = {
            title: "Changes of House Price quarterly (1975 - 2022)",
            xaxis: {title: 'Quarter/Year'},
            yaxis: {title: 'House Price/Interest Rate'},
            autosize: false,
        }
        Plotly.newPlot('line_graph2', data, layout);
        
    })
}


function createAreaGraph() {
    d3.json(url).then((data) => {
        let annual_interest_rate = data.annual_interest_rate
        let annual_interest_rate_yValues = []
        let annual_interest_rate_xValues = []
        for (let index = 0; index < annual_interest_rate.length; index++) {
            let annual_interest_rate_y = annual_interest_rate[index]['fixed_30_year_rate']
            annual_interest_rate_yValues.push(annual_interest_rate_y)
            let annual_interest_rate_x = annual_interest_rate[index]['year_quarter']
            annual_interest_rate_xValues.push(annual_interest_rate_x)
        }
        // console.log(annual_interest_rate_xValues)
        // console.log(annual_interest_rate_yValues)

        var trace1 = {
            x: annual_interest_rate_xValues, 
            y: annual_interest_rate_yValues, 
            fill: 'tozeroy',
            type: 'scatter',
            mode: 'none'
        };
        
        var data = [trace1];
        var layout = {
            title: "United State Interest Rate annually (1975 - 2022)",
            xaxis: {title: 'Year'},
            yaxis: {title: 'US Interest Rate'},
            autosize: false,
        }
        Plotly.newPlot('graph', data, layout);
        
    })
}


function createAreaGraph2() {
    d3.json(url).then((data) => {
        let quarterly_interest_rate = data.quarterly_interest_rate
        let quarterly_interest_rate_yValues = []
        let quarterly_interest_rate_xValues = []
        for (let index = 0; index < quarterly_interest_rate.length; index++) {
            let quarterly_interest_rate_y = quarterly_interest_rate[index]['fixed_30_year_rate']
            quarterly_interest_rate_yValues.push(quarterly_interest_rate_y)
            let quarterly_interest_rate_x = quarterly_interest_rate[index]['year_quarter']
            quarterly_interest_rate_xValues.push(quarterly_interest_rate_x)
        }


        var trace1 = {
            x: quarterly_interest_rate_xValues, 
            y: quarterly_interest_rate_yValues, 
            fill: 'tozeroy',
            type: 'scatter',
            mode: 'none'
        };
        
        var data = [trace1];
        var layout = {
            title: "United State Interest Rate quarterly (1975 - 2022)",
            xaxis: {title: 'Quarter/Year'},
            yaxis: {title: 'US Interest Rate'},
            autosize: false,
        }
        Plotly.newPlot('graph2', data, layout);
        
    })
}
//run init function
init()





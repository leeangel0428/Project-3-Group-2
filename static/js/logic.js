console.log("hello project 3")

const url = "http://127.0.0.1:5000/data"

// Promise
const dataPromise = d3.json(url);
console.log("Data Promise: ", dataPromise);

// Obtain Json data and console log
d3.json(url).then(function(data) {
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


function createLineChart(region) {
    d3.json(url).then((data) => {
        let regionValues= data.annual_family_income
        let xValues=[]
        for (let index=0; index < regionValues.length; index++){
            let column= region
            let x= regionValues[index][column]
            console.log(x)
            xValues.push(x)
        }
        console.log(xValues)
})}

// var trace1 = {
//     x: x_values, //[1, 2, 3, 4, 5]
//     y: y_values, //[1, 4, 9, 16, 25]
//     type: 'scatter'
//   };
//   let data = [trace1];
//   Plotly.newPlot('line_graph', data);

//function to update all the plots when a new region is selected
// function optionChanged(value)
// { 
//     console.log(value); 
//     createRegionInfo(value);
//     createLineChart(value);

// };

//run init function
init()
let region = "Midwest"
createLineChart(region)
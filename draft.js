d3.csv("grande_renamed_sugar.csv").then(data => {
    // set data for reuse in build charts
    console.log(data);

    let updateData = (beverage) => {
        console.log(data.filter(drink => drink.Beverage_category === beverage));
        // this is where your nutrition table modification/creation code
        // and chart modification/creation code should go        

        let pieTrace = [{
            values: Beverage_category.sugars,
            labels: Beverage_category,
            type: "pie",
            title: "Sugar in Grams",
            hoverinfo: 'lbbel+percent+name',
            hole: .4
        }];
        let layout = "Sugar in G per Beverage Category"
        annotations: [{
            font: {
                size: 20
            },
            showarrow: false,
            text: 'Daily Recommended Sugar intake is 30 g.',
            x: 0.17,
            y: 0.5,
            layout:{
                height: 400,
                width: 500
            }
        }],
   
    Plotly.newPlot('pie', data, layout);
};

// },
//     drinks = [...new Set(data.map(drink => drink.Beverage))]
//         bev_select = d3.select('#selDataset');

// bev_select.selectAll('option')
//     .data(drinks)
//     .enter()
//     .append('option')
//     .text(d => d);

// bev_select.on('change', (e) => {
//     let beverage = bev_select.node().value;
//     updateData(beverage);
// })

// updateData('Brewed Coffee');
// });



//     let 
//         // set ids to create options below    
//         ids = data.names,
//         // select dropdown to populate with ids below
//         dropdown = d3.select("#selDataset");

//     console.log("ids:", ids)
//     // create option elements for
//     // the dropdown select of ids
//     dropdown.selectAll('options')
//         // sets data to be loaded
//         .data(ids)
//         // actions below enter() are
//         // what occur when new data is detected
//         .enter()
//         .append('option')
//         .text((d) => d);

//     // init with first value
//     // call inside d3.json call
//     // so only called if successful
//     buildCharts(940, data);

//     // add event listent to dropdown to rebuild
//     // charts when the value is changed
//     dropdown.on('change', (e) => {
//         // reference dropdown actual element and value
//         let selected_id = dropdown.node().value
//         buildCharts(selected_id, data);
//     });


// /*
//  Function where id and data are passed to set metadata "table",
//  bar and bubble charts
//  */
// function buildCharts(selected_id, data) {

//     // reference part of data needed to build different
//     // items on the page with javascript destructuring:
//     // - metadata table
//     // - same data for bubble and bar charts
//     let { metadata, samples } = selectData(selected_id, data);

//     //demo info
//     meta_init(metadata);
//     gauge_init(metadata);

//     //CHARTS
//     bar_init(samples);
//     bubble_init(samples);
// }

// // selects data from data parameters
// // based on the id parameters
// function selectData(id, data) {
//     // set find function for reuse by both
//     // metadata and samples since key names we're
//     // looking for are the same
//     let findFn = subject => subject.id == id;

//     // find first matching value using findFn
//     // for both metadata and samples
//     return {
//         metadata: data.metadata.find(findFn),
//         samples: data.samples.find(findFn)
//     };
// }

// // set content for metadata table
// function meta_init(metadata){
//     // grab reference to metadata element
//     meta_div = d3.select("#sample-metadata");
//     // empty html
//     meta_div.html("");
//      Object.entries(metadata).forEach(([key, value]) => {
//          meta_div.append("p")
//             .attr('class', 'metadata-property')
//             .html(`<strong>${key}:</strong>${value}`)
//      });
// }
// //Bar Chart
// function bar_init(samples) {
//     let trace = {
//         x: samples.sample_values.slice(0, 10).reverse(),
//         y: samples.otu_ids.map(id => `OTU ${id}`).slice(0, 10).reverse(),
//         type: "bar",
//         orientation: "h",
//         title:"OTU Labels",
//         marker: {
//             color: 'darkseagreen'
//           }

//     };

//     traceData = [trace];
//     let layout = {
//         title: "OTU Labels"
//     }
//     Plotly.newPlot("bar", traceData, layout)

// }

// //Bubble Chart
// function bubble_init(samples) {
//     let trace = {
//         x: samples.otu_ids,
//         y: samples.sample_values,
//         text: samples.otu_labels,
//         mode: "markers",
//         marker: {
//             size: samples.sample_values.map(value => Math.log(value)*15),
//             color: samples.otu_ids,
//             colorscale: "YlGnBu"
//         }

//     };
//     let traceData = [trace];
//     let layout = {
//         title: "Bubble Chart for each sample"
//     }
//     Plotly.newPlot("bubble", traceData, layout)
});
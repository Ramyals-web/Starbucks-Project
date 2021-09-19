d3.csv("starbucks_nutrition.csv").then(data => {
    // set data for reuse in build charts
    console.log(data);
    
    // recommended daily values
    let guidelines = {
            "Calories": 2700,
            "Total Fat (g)": 60,
            "Trans Fat (g)": 2,
            "Saturated Fat (g)": 13,
            "Sodium (mg)": 2300,
            "Total Carbohydrates (g)": 275,
            "Cholesterol (mg)": 300,
            "Sugars (g)": 30,
            "Caffeine (mg)": 400,
            // too much is okay
            "Protein (g)": 51,
            "Vitamin A (% DV)": 100,
            "Vitamin C (% DV)": 100,
            "Calcium (% DV)": 100,
            "Iron (% DV)": 100,
            "Dietary Fibre (g)": 23
        },
        non_num_keys = ['Beverage_category','Beverage','Beverage_prep','Size'],
        num_keys = [
            'Calories','Total Fat (g)','Trans Fat (g)','Saturated Fat (g)','Sodium (mg)',
            'Total Carbohydrates (g)','Cholesterol (mg)','Dietary Fibre (g)','Sugars (g)','Protein (g)',
            'Vitamin A (% DV)','Vitamin C (% DV)','Calcium (% DV)','Iron (% DV)','Caffeine (mg)'
        ];

    let updateData = (beverage) => {
            // filter by beverage values; however, will contain additional
            // sizes and beverage prep data
            let sel_bev_data = data.filter(drink => drink.Beverage === beverage)
                // separate labels from actual numeric data
                .map(bev => {
                    // iterate through objects keys and values by using .entries()
                    return Object.entries(bev)
                        // pass accumulator and destructure to separate key value variables with [k,v]
                        .reduce((accum, [k,v]) => {
                            // get rid of space at beginning and ending
                            // of key values so the key will match the item
                            // in non_num_keys where there is no space
                            k = k.trim();
                            // if in non numeric list of keys, add values to a label key
                            if(non_num_keys.includes(k)) {
                                accum.labels[k] = v;
                            } else { // if the key has numeric data
                                accum.numeric[k] = v;
                            }

                            // return accummulator otherwise,
                            // we will end up with undefined
                            return accum;
                        }, {numeric: {}, labels: {}}); // <-- initialize accumulator with numeric and label keys
                });

            // iterate known data keys and create charts for each one
            num_keys.forEach(k => {
                console.group(k);


                // return separate data sets for what we want for our
                // x and y axis
                let [x, y] = sel_bev_data.reduce(([x,y], {numeric, labels}) => {
                    // push concatenated text for labels to x axis array
                    x.push(`${labels.Size}, ${labels.Beverage_prep}`);
                    // push numeric values to y axis array
                    y.push(numeric[k]);

                    // return as separate arrays so they can be
                    // destructure to different x and y arrays
                    return [x, y];
                }, [[],[]]); // <-- initialize empty x and y arrays

                console.log(x, y);
                console.groupEnd(k);

                // create plotly trace object
                let trace = {
                    x: x,
                    y: y,
                    name: k,
                    type: "bar",
                    orientation: "v",
                    marker: {
                        color: 'darkseagreen'
                    }            
                };
            
                // wrap trace in array
                traceData = [trace];
                // set title for the chart
                let layout = {
                    title: k,
                    shapes: [
                        {
                            type: 'line',
                            xref: 'paper',
                            x0: 0,
                            y0: guidelines[k],
                            x1: 1,
                            y1: guidelines[k],
                            line:{
                                color: 'rgb(255, 0, 0)',
                                width: 4,
                                dash:'dot'
                            },
                            name: 'Daily Recommended Value'
                        }
                    ],
                    showlegend: true
                };

                // clean k value so it can be used as part of an html id
                // we need separate ids for each bar chart or it will get replaced
                // for every type of data
                let clean_k = k.toLowerCase().split("(")[0].trim().replace(' ','-');
                console.log(clean_k);
                // create chart
                Plotly.newPlot(`bar-${clean_k}`, traceData, layout);
            });
        },
        // create unique list of drinks
        drinks = [...new Set(data.map(drink => drink.Beverage))]
        bev_select = d3.select('#selDataset');

    bev_select.selectAll('option')
        .data(drinks)
        .enter()
        .append('option')
        .text(d => d);

    bev_select.on('change', (e) => {
        let beverage = bev_select.node().value;
        updateData(beverage);
    })

    updateData('Brewed Coffee');
});
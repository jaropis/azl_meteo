(function plot_data () {
azl = document.getElementById('azl');
        fetch('http://opengranary.com:8000/')
            .then(response => response.json())
            .then(json => {
                var trace_pressure = {x: json['time'],
                                  y: json['pressure'],
                                  
                };
                var trace_temperature = {x: json['time'],
                                  y: json['temperature'],
                                  yaxis: 'y2',
                };
                var trace_inside_humidity = {x: json['time'],
                                  y: json['inside_humidity'],
                                  yaxis: 'y3',
                };
                var trace_outside_humidity = {x: json['time'],
                                  y: json['outside_humidity'],
                                  yaxis: 'y4',
                };
                var trace_rain = {x: json['time'],
                                  y: json['rain'],
                                  yaxis: 'y5',
                };
                console.log(trace_pressure)
                console.log(trace_temperature)
                var data_azl = [trace_pressure, trace_temperature, trace_inside_humidity, trace_outside_humidity, trace_rain]
                var layout = {
                    grid: {
                        rows: 5,
                        columns: 1,
                        subplots: [['xy'], ['xy2'], ['xy3'], ['xy4'], ['xy5']]
                    },
                    yaxis: {
                        title: 'ciśnienie [mmHG]',
                    },
                    yaxis2: {
                        title: 'temperatura [C]',
                    },
                    yaxis3: {
                        title: 'wilgotność wewnątrz [%]',
                    },
                    yaxis4: {
                        title: 'wilgotność na zewnątrz [%]',
                    },
                    yaxis5: {
                        title: 'opady [mm]',
                    },
                    showlegend: false
                };
                Plotly.newPlot(azl, data_azl, layout);
            });
})();
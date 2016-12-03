$(document).ready(function() {

   $(".stats").each(function() {
       debugger
       id = $(this).attr('id').split("_")[1];
       correct_cnt = parseInt($(this).find(".correct_first_attempts").text().trim());
       wrong_cnt = parseInt($(this).find(".wrong_first_attempts").text().trim());
       data_array_str = $(this).find(".entrys_array").text().trim();
       data_array = data_array_str.substring(1, data_array_str.length - 1).split(",");
       totalGraph("total_graph_" + id, correct_cnt, wrong_cnt);
       entrysGraph("entrys_graph_" + id, data_array);
       $(this).find(".plain_text").hide();
   })
});

var entrysGraph = function(divId, entryChoice) {
    yData = [];
    for (i = 0; i < entryChoice.length; ++i) {
        yData.push({name: "Entry " + (i + 1), data: [parseInt(entryChoice[i].trim())]});
    }
    Highcharts.chart(divId, {
        chart: {
            type: 'column'
        },
        title: {
            text: 'First Attempt Choices'
        },
        yAxis: {
            type: 'category'
        },
        xAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: 'Attempts'
            }
        },

        series: yData,

        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    });
}

var totalGraph = function(divId, correct_cnt, wrong_cnt) {
    Highcharts.chart(divId, {
        chart: {
            type: 'bar'
        },
        title: {
            text: 'First Attempt'
        },
        xAxis: {
            categories: ['']
        },
        yAxis: {
            allowDecimals: false,
            min: 0,
            max: correct_cnt + wrong_cnt,
            title: {
                text: 'Attempts'
            }
        },
        legend: {
            reversed: true
        },
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },
        series: [{
            name: 'Correct',
            data: [correct_cnt]
        }, {
            name: 'Wrong',
            data: [wrong_cnt]
        }]
    });
}

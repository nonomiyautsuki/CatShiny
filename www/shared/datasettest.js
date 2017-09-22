      var dataset = [5, 10, 15, 20, 25];

        /*d3.select("body").selectAll("p")
         .data(dataset)
         .enter()
         .append("p")
         .text("I am a cat.");*/

        d3.select("body").selectAll("p")
                .data(dataset)
                .enter()
                .append("p")
                .attr("class", "bar")
                .style("height", function (d) {
                    var barHeight = d * 5;
                    return barHeight + "px";
                });

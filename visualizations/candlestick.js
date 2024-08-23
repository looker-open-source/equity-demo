looker.plugins.visualizations.add({
  options: {
    color_up: {
      type: "string",
      label: "Up Color",
      default: "#4CAF50"
    },
    color_down: {
      type: "string",
      label: "Down Color",
      default: "#F44336"
    }
  },

  create: function(element, config) {
    element.innerHTML = '<div id="candlestick-chart"></div>';
    this.chartElement = element.appendChild(document.createElement("div"));
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (typeof d3 === "undefined") {
      var script = document.createElement('script');
      script.src = 'https://d3js.org/d3.v5.min.js';
      script.onload = () => {
        this.drawChart(data, element, config, queryResponse, details, done);
      };
      document.head.appendChild(script);
    } else {
      this.drawChart(data, element, config, queryResponse, details, done);
    }
  },

  drawChart: function(data, element, config, queryResponse, details, done) {
    if (queryResponse.fields.dimensions.length < 5) {
      this.addError({title: "Invalid Data", message: "This chart requires five dimensions: date, high, low, open, close"});
      return;
    }

    const dimensions = queryResponse.fields.dimensions.map(d => d.name);
    const requiredFields = ['date', 'high', 'low', 'open', 'close'];
    const missingFields = requiredFields.filter(f => !dimensions.some(d => d.toLowerCase().includes(f)));

    if (missingFields.length > 0) {
      this.addError({title: "Missing Fields", message: `Please include dimensions for: ${missingFields.join(', ')}`});
      return;
    }

    const dateField = dimensions.find(d => d.toLowerCase().includes('date'));
    const highField = dimensions.find(d => d.toLowerCase().includes('high'));
    const lowField = dimensions.find(d => d.toLowerCase().includes('low'));
    const openField = dimensions.find(d => d.toLowerCase().includes('open'));
    const closeField = dimensions.find(d => d.toLowerCase().includes('close'));

    const chartData = data.map(d => ({
      date: new Date(d[dateField].value),
      high: +d[highField].value,
      low: +d[lowField].value,
      open: +d[openField].value,
      close: +d[closeField].value
    }));

    const margin = {top: 40, right: 40, bottom: 100, left: 80};
    const width = element.clientWidth - margin.left - margin.right;
    const height = element.clientHeight - margin.top - margin.bottom;

    d3.select(this.chartElement).selectAll("*").remove();

    const svg = d3.select(this.chartElement)
      .append('svg')
      .attr('width', width + margin.left + margin.right)
      .attr('height', height + margin.top + margin.bottom)
      .append('g')
      .attr('transform', `translate(${margin.left},${margin.top})`);

    const x = d3.scaleBand()
      .range([0, width])
      .padding(0.1);

    const y = d3.scaleLinear()
      .range([height, 0]);

    x.domain(chartData.map(d => d.date));
    y.domain([d3.min(chartData, d => d.low), d3.max(chartData, d => d.high)]);

    // X axis
    svg.append('g')
      .attr('transform', `translate(0,${height})`)
      .call(d3.axisBottom(x)
        .tickValues(x.domain().filter((d,i) => !(i%Math.floor(chartData.length/10))))
        .tickFormat(d3.timeFormat("%Y-%m-%d")))
      .selectAll('text')
      .style('text-anchor', 'end')
      .attr('dx', '-.8em')
      .attr('dy', '.15em')
      .attr('transform', 'rotate(-45)');

    // X axis label
    svg.append("text")
      .attr("transform", `translate(${width/2}, ${height + margin.bottom - 10})`)
      .style("text-anchor", "middle");
     // .text("Date");

    // Y axis
    svg.append('g')
      .call(d3.axisLeft(y)
        .tickFormat(d3.format("$.2f"))); // Format y-axis ticks as currency

    // Y axis label
    svg.append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 0 - margin.left)
      .attr("x", 0 - (height / 2))
      .attr("dy", "1em")
      .style("text-anchor", "middle");
     // .text("Price ($)");

    // Create a tooltip
    const tooltip = d3.select(this.chartElement)
      .append("div")
      .style("opacity", 0)
      .attr("class", "tooltip")
      .style("background-color", "white")
      .style("border", "solid")
      .style("border-width", "1px")
      .style("border-radius", "5px")
      .style("padding", "10px")
      .style("position", "absolute");

    // Functions to show and hide the tooltip
    const mouseover = function(d) {
      tooltip.style("opacity", 1)
    }
    const mousemove = function(d) {
      tooltip
        .html(`Date: ${d3.timeFormat("%Y-%m-%d")(d.date)}<br>Open: $${d.open.toFixed(2)}<br>Close: $${d.close.toFixed(2)}<br>High: $${d.high.toFixed(2)}<br>Low: $${d.low.toFixed(2)}`)
        .style("left", (d3.event.pageX + 10) + "px")
        .style("top", (d3.event.pageY - 10) + "px")
    }
    const mouseleave = function(d) {
      tooltip.style("opacity", 0)
    }

    svg.selectAll('.candle')
      .data(chartData)
      .enter()
      .append('line')
      .attr('x1', d => x(d.date) + x.bandwidth() / 2)
      .attr('x2', d => x(d.date) + x.bandwidth() / 2)
      .attr('y1', d => y(d.high))
      .attr('y2', d => y(d.low))
      .attr('stroke', d => d.open > d.close ? config.color_down : config.color_up)
      .on("mouseover", mouseover)
      .on("mousemove", mousemove)
      .on("mouseleave", mouseleave);

    svg.selectAll('.candle')
      .data(chartData)
      .enter()
      .append('rect')
      .attr('x', d => x(d.date))
      .attr('y', d => y(Math.max(d.open, d.close)))
      .attr('width', x.bandwidth())
      .attr('height', d => Math.abs(y(d.open) - y(d.close)))
      .attr('fill', d => d.open > d.close ? config.color_down : config.color_up)
      .on("mouseover", mouseover)
      .on("mousemove", mousemove)
      .on("mouseleave", mouseleave);

    done();
  }
});

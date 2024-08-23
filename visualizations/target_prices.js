looker.plugins.visualizations.add({
  id: "target_prices"
  label: "Target Prices"
  options: {
    font_family: {
      type: "string",
      label: "Font Family",
      default: "Arial, sans-serif"
    },
    color_low: {
      type: "string",
      display: "color",
      label: "Low Color",
      default: "#e74c3c"  // Changed to red
    },
    color_current: {
      type: "string",
      display: "color",
      label: "Current Color",
      default: "#2c3e50"  // Kept as black
    },
    color_average: {
      type: "string",
      display: "color",
      label: "Average Color",
      default: "#4287f5"  // Changed to blue
    },
    color_median: {
      type: "string",
      display: "color",
      label: "Median Color",
      default: "#f39c12"  // Kept as yellow
    },
    color_high: {
      type: "string",
      display: "color",
      label: "High Color",
      default: "#27ae60"  // Changed to green
    }
  },

  create: function(element, config) {
    element.innerHTML = '<div id="price-target-viz"><div style="padding: 20px;">Loading visualization...</div></div>';
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    if (typeof d3 === 'undefined') {
      const script = document.createElement('script');
      script.src = 'https://d3js.org/d3.v5.min.js';
      script.onload = () => { this.drawVisualization(data, element, config, queryResponse, details, done); };
      document.head.appendChild(script);
    } else {
      this.drawVisualization(data, element, config, queryResponse, details, done);
    }
  },

  drawVisualization: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (data.length === 0 || Object.keys(data[0]).length < 5) {
      this.addError({title: "No Data", message: "This chart requires dimensions for low, current, average, median, and high price targets."});
      return;
    }

    const margin = {top: 40, right: 40, bottom: 60, left: 40};  // Reduced bottom margin
    const width = element.clientWidth - margin.left - margin.right;
    const height = 180;  // Reduced height

    const priceData = data[0];
    const prices = [
      {label: "Low", value: priceData[queryResponse.fields.dimensions[0].name].value, color: config.color_low},
      {label: "Current", value: priceData[queryResponse.fields.dimensions[1].name].value, color: config.color_current},
      {label: "Average", value: priceData[queryResponse.fields.dimensions[2].name].value, color: config.color_average},
      {label: "Median", value: priceData[queryResponse.fields.dimensions[3].name].value, color: config.color_median},
      {label: "High", value: priceData[queryResponse.fields.dimensions[4].name].value, color: config.color_high}
    ];

    const parseCurrency = (value) => {
      if (typeof value === 'string') {
        return parseFloat(value.replace(/[^0-9.-]+/g,""));
      } else if (typeof value === 'number') {
        return value;
      }
      return 0; // default value if parsing fails
    };

    prices.forEach(p => p.numericValue = parseCurrency(p.value));

    d3.select("#price-target-viz").html("");

    const svg = d3.select("#price-target-viz")
      .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", `translate(${margin.left},${margin.top})`);

    const xScale = d3.scaleLinear()
      .domain([d3.min(prices, d => d.numericValue), d3.max(prices, d => d.numericValue)])
      .range([0, width]);

    const updateAxis = () => {
      const tickCount = Math.max(2, Math.floor(width / 100));  // Adjust tick count based on width
      const axis = d3.axisBottom(xScale)
        .ticks(tickCount)
        .tickFormat(d => d3.format("$,.2f")(d));

      svg.select(".x-axis")
        .call(axis)
        .select(".domain")
        .attr("stroke-width", 2);
    };

    svg.append("g")
      .attr("class", "x-axis")
      .attr("transform", `translate(0,${height/2})`)
      .call(updateAxis);

    svg.append("line")
      .attr("x1", 0)
      .attr("x2", width)
      .attr("y1", height/2)
      .attr("y2", height/2)
      .attr("stroke", "#ccc")
      .attr("stroke-width", 4);

    function drawMarker(price, index, array) {
      const g = svg.append("g")
        .attr("transform", `translate(${xScale(price.numericValue)},${height/2})`);

      g.append("circle")
        .attr("r", 6)
        .attr("fill", price.color);

      const label = g.append("g")
        .attr("transform", `translate(0,${index % 2 === 0 ? -height/4 : height/4})`);

      const text = label.append("text")
        .attr("y", index % 2 === 0 ? -15 : 15)
        .attr("text-anchor", "middle")
        .attr("font-family", config.font_family)
        .attr("font-size", "12px")
        .attr("fill", "#333")
        .text(price.value);

      const bbox = text.node().getBBox();
      const padding = 4;

      label.insert("rect", "text")
        .attr("x", bbox.x - padding)
        .attr("y", bbox.y - padding)
        .attr("width", bbox.width + (padding * 2))
        .attr("height", bbox.height + (padding * 2))
        .attr("rx", 4)
        .attr("ry", 4)
        .attr("fill", "white")
        .attr("stroke", price.color)
        .attr("stroke-width", 2);

      label.append("text")
        .attr("y", index % 2 === 0 ? -40 : 40)
        .attr("text-anchor", "middle")
        .attr("font-family", config.font_family)
        .attr("font-size", "10px")
        .attr("fill", "#666")
        .text(price.label);

      return g;
    }

    const markers = prices.map(drawMarker);

    // Add resize listener
    const resizeObserver = new ResizeObserver(() => {
      const newWidth = element.clientWidth - margin.left - margin.right;
      svg.attr("width", newWidth + margin.left + margin.right);
      xScale.range([0, newWidth]);
      updateAxis();
      markers.forEach((marker, i) => {
        marker.attr("transform", `translate(${xScale(prices[i].numericValue)},${height/2})`);
      });
    });

    resizeObserver.observe(element);

    done();
  }
});

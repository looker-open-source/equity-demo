looker.plugins.visualizations.add({
    id: 'crypto_heatmap',
    label: 'Crypto Heatmap',
    options: {
      font_size: {
        type: 'number',
        label: 'Font Size',
        default: 12
      }
    },
    create: function(element, config) {
      element.innerHTML = '<div id="heatmap"></div>';
    },
    updateAsync: function(data, element, config, queryResponse, details, done) {
      this.clearErrors();

      // Check for data
      if (!data || data.length === 0) {
        this.addError({title: "No Data", message: "This chart requires data to render."});
        return;
      }

      // Parse the data
      const parsedData = data.map(row => ({
        id: row[queryResponse.fields.dimensions[0].name].value,
        current_price: row[queryResponse.fields.measures[0].name].value,
        market_cap: row[queryResponse.fields.measures[1].name].value,
        price_change_24h: row[queryResponse.fields.measures[2].name].value
      }));

      // Sort data by market cap (descending)
      parsedData.sort((a, b) => b.market_cap - a.market_cap);

      // Calculate layout
      const margin = {top: 10, right: 10, bottom: 10, left: 10};
      const width = element.clientWidth - margin.left - margin.right;
      const height = element.clientHeight - margin.top - margin.bottom;

      // Create SVG
      const svg = d3.select("#heatmap")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", `translate(${margin.left},${margin.top})`);

      // Create color scale with gradient
      const colorScale = d3.scaleLinear()
        .domain([d3.min(parsedData, d => d.price_change_24h), 0, d3.max(parsedData, d => d.price_change_24h)])
        .range(["#ff4136", "#ffffff", "#2ecc40"])
        .interpolate(d3.interpolateRgb);

      // Create size scale
      const sizeScale = d3.scaleSqrt()
        .domain([0, d3.max(parsedData, d => d.market_cap)])
        .range([0, Math.min(width, height) / 4]);

      // Create treemap layout
      const treemap = d3.treemap()
        .size([width, height])
        .padding(1);

      const root = d3.hierarchy({children: parsedData})
        .sum(d => d.market_cap);

      treemap(root);

      // Create cells
      const cell = svg.selectAll("g")
        .data(root.leaves())
        .enter().append("g")
        .attr("transform", d => `translate(${d.x0},${d.y0})`);

      cell.append("rect")
        .attr("width", d => d.x1 - d.x0)
        .attr("height", d => d.y1 - d.y0)
        .attr("fill", d => colorScale(d.data.price_change_24h));

      cell.append("text")
        .attr("x", d => (d.x1 - d.x0) / 2)
        .attr("y", d => (d.y1 - d.y0) / 2)
        .attr("text-anchor", "middle")
        .attr("dominant-baseline", "middle")
        .text(d => d.data.id)
        .style("font-size", config.font_size + "px")
        .style("fill", d => d3.lab(colorScale(d.data.price_change_24h)).l < 50 ? "#fff" : "#000");

      // Add hover effect and tooltip
      const tooltip = d3.select("body").append("div")
        .attr("class", "tooltip")
        .style("opacity", 0)
        .style("position", "absolute")
        .style("background-color", "white")
        .style("border", "solid")
        .style("border-width", "1px")
        .style("border-radius", "5px")
        .style("padding", "10px");

      cell.on("mouseover", function(event, d) {
        d3.select(this).select("rect").style("stroke", "#000").style("stroke-width", 2);
        tooltip.transition()
          .duration(200)
          .style("opacity", .9);
        tooltip.html(`
          <strong>${d.data.id}</strong><br/>
          Price: $${d.data.current_price.toLocaleString()}<br/>
          Market Cap: $${d.data.market_cap.toLocaleString()}<br/>
          24h Change: ${d.data.price_change_24h.toFixed(2)}%
        `)
          .style("left", (event.pageX + 10) + "px")
          .style("top", (event.pageY - 28) + "px");
      })
      .on("mouseout", function() {
        d3.select(this).select("rect").style("stroke", "none");
        tooltip.transition()
          .duration(500)
          .style("opacity", 0);
      });

      done();
    }
  });

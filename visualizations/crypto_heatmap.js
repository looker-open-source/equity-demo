looker.plugins.visualizations.add({
  id: "crypto_heatmap",
  label: "Cryptocurrency Heatmap",
  options: {
    min_font_size: {
      type: "number",
      label: "Minimum Font Size",
      default: 8,
      section: "Style"
    },
    positive_color: {
      type: "string",
      label: "Positive Color",
      default: "#005a32",
      display: "color",
      section: "Colors"
    },
    neutral_color: {
      type: "string",
      label: "Neutral Color",
      default: "#252525",
      display: "color",
      section: "Colors"
    },
    negative_color: {
      type: "string",
      label: "Negative Color",
      default: "#67000d",
      display: "color",
      section: "Colors"
    }
  },
  create: function(element, config) {
    element.innerHTML = '<div id="crypto-heatmap" style="width: 100%; height: 100%;"></div>';
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();
    if (typeof d3 === "undefined") {
      var script = document.createElement('script');
      script.src = 'https://d3js.org/d3.v6.min.js';
      script.onload = () => {
        this.drawChart(data, element, config, queryResponse, details, done);
      };
      script.onerror = () => {
        this.addError({ title: "Error Loading D3", message: "Failed to load D3 library" });
        done();
      };
      document.head.appendChild(script);
    } else {
      this.drawChart(data, element, config, queryResponse, details, done);
    }
  },
  drawChart: function(data, element, config, queryResponse, details, done) {
    try {
      // Check if we have data
      if (!data || data.length === 0) {
        this.addError({ title: "No Data", message: "The query returned no results." });
        return done();
      }

      const requiredFields = ['symbol', 'price', 'market_cap', 'change'];
      let missingFields = [];
      requiredFields.forEach(field => {
        if (!queryResponse.fields.dimensions.find(f => f.name.includes(field))) {
          missingFields.push(field);
        }
      });

      if (missingFields.length > 0) {
        this.addError({ title: "Missing Fields", message: `The following fields are missing: ${missingFields.join(', ')}` });
        return done();
      }

      const symbolField = queryResponse.fields.dimensions.find(f => f.name.includes('symbol')).name;
      const priceField = queryResponse.fields.dimensions.find(f => f.name.includes('price')).name;
      const marketCapField = queryResponse.fields.dimensions.find(f => f.name.includes('market_cap')).name;
      const changeField = queryResponse.fields.dimensions.find(f => f.name.includes('change')).name;

      const cryptocurrencies = data.map(d => ({
        symbol: d[symbolField].value,
        price: parseFloat(d[priceField].value) || 0,
        marketCap: parseFloat(d[marketCapField].value) || 0,
        change: parseFloat(d[changeField].value) || 0
      })).filter(d => d.marketCap > 0); // Filter out entries with invalid market cap

      if (cryptocurrencies.length === 0) {
        this.addError({ title: "Invalid Data", message: "No valid cryptocurrency data found after processing." });
        return done();
      }

      const width = element.clientWidth;
      const height = element.clientHeight;

      if (width === 0 || height === 0) {
        this.addError({ title: "Invalid Dimensions", message: "The chart area has no width or height." });
        return done();
      }

      const colorScale = d3.scaleLinear()
        .domain([-10, -2, 0, 2, 10])
        .range([
          config.negative_color || "#67000d",
          d3.interpolate(config.negative_color || "#67000d", config.neutral_color || "#252525")(0.5),
          config.neutral_color || "#252525",
          d3.interpolate(config.neutral_color || "#252525", config.positive_color || "#005a32")(0.5),
          config.positive_color || "#005a32"
        ]);

      const treemap = d3.treemap()
        .size([width, height])
        .padding(1)
        .round(true);

      const root = d3.hierarchy({children: cryptocurrencies})
        .sum(d => Math.log(d.marketCap + 1)) // Using log scale for less extreme size differences, adding 1 to avoid log(0)
        .sort((a, b) => b.value - a.value);

      treemap(root);

      const chart = d3.select("#crypto-heatmap");
      chart.selectAll("*").remove();

      const svg = chart.append("svg")
        .attr("width", width)
        .attr("height", height)
        .style("font-family", "Arial, sans-serif")
        .style("background-color", "#1C1C1C");

      const leaf = svg.selectAll("g")
        .data(root.leaves())
        .join("g")
        .attr("transform", d => `translate(${d.x0},${d.y0})`);

      leaf.append("rect")
        .attr("width", d => Math.max(0, d.x1 - d.x0))
        .attr("height", d => Math.max(0, d.y1 - d.y0))
        .attr("fill", d => colorScale(d.data.change));

      const minFontSize = config.min_font_size || 8;
      const fontSize = d => Math.max(minFontSize, Math.min(14, (d.x1 - d.x0) / 5, (d.y1 - d.y0) / 3));

      leaf.append("text")
        .attr("x", 3)
        .attr("y", d => fontSize(d) + 2)
        .text(d => d.data.symbol)
        .attr("font-size", d => `${fontSize(d)}px`)
        .attr("fill", "white")
        .attr("font-weight", "bold")
        .each(function(d) {
          const self = d3.select(this);
          let textLength = self.node().getComputedTextLength();
          let textSpace = Math.max(0, d.x1 - d.x0 - 6);
          if (textLength > textSpace) {
            self.text(d.data.symbol.slice(0, Math.max(1, Math.floor(d.data.symbol.length * (textSpace / textLength)))) + '...');
          }
        });

      leaf.append("text")
        .attr("x", 3)
        .attr("y", d => fontSize(d) * 2 + 4)
        .text(d => d.data.change.toFixed(2) + "%")
        .attr("font-size", d => `${fontSize(d) * 0.9}px`)
        .attr("fill", "white");

      leaf.append("title")
        .text(d => `${d.data.symbol}\nPrice: $${d.data.price.toFixed(2)}\nMarket Cap: $${d.data.marketCap.toLocaleString()}\nChange: ${d.data.change.toFixed(2)}%`);

    } catch (error) {
      console.error("Error in drawChart:", error);
      this.addError({ title: "Error Drawing Chart", message: error.message });
    }

    done();
  }
});
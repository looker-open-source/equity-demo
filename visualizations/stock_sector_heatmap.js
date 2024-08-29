looker.plugins.visualizations.add({
  id: "stock_sector_heatmap",
  label: "Stock Sector Heatmap",
  options: {
    min_font_size: {
      type: "number",
      label: "Minimum Font Size",
      default: 8,
      section: "Style"
    },
    color_negative_high: {
      type: "string",
      label: "Color for High Negative Change",
      default: "#67000d",
      section: "Colors",
      display: "color"
    },
    color_negative_medium: {
      type: "string",
      label: "Color for Medium Negative Change",
      default: "#a50f15",
      section: "Colors",
      display: "color"
    },
    color_negative_low: {
      type: "string",
      label: "Color for Low Negative Change",
      default: "#cb181d",
      section: "Colors",
      display: "color"
    },
    color_neutral: {
      type: "string",
      label: "Color for Neutral Change",
      default: "#252525",
      section: "Colors",
      display: "color"
    },
    color_positive_low: {
      type: "string",
      label: "Color for Low Positive Change",
      default: "#41ab5d",
      section: "Colors",
      display: "color"
    },
    color_positive_medium: {
      type: "string",
      label: "Color for Medium Positive Change",
      default: "#238b45",
      section: "Colors",
      display: "color"
    },
    color_positive_high: {
      type: "string",
      label: "Color for High Positive Change",
      default: "#005a32",
      section: "Colors",
      display: "color"
    }
  },
  create: function(element, config) {
    element.innerHTML = '<div id="stock-heatmap" style="width: 100%; height: 100%;"></div>';
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
      const requiredFields = ['symbol', 'current_price', 'market_cap', 'sector', 'change'];
      requiredFields.forEach(field => {
        if (!queryResponse.fields.dimensions.find(f => f.name.includes(field))) {
          throw new Error(`Missing required field: ${field}`);
        }
      });

      const symbolField = queryResponse.fields.dimensions.find(f => f.name.includes('symbol')).name;
      const priceField = queryResponse.fields.dimensions.find(f => f.name.includes('current_price')).name;
      const marketCapField = queryResponse.fields.dimensions.find(f => f.name.includes('market_cap')).name;
      const sectorField = queryResponse.fields.dimensions.find(f => f.name.includes('sector')).name;
      const changeField = queryResponse.fields.dimensions.find(f => f.name.includes('change')).name;

      const stocks = data.map(d => ({
        symbol: d[symbolField].value,
        price: parseFloat(d[priceField].value),
        marketCap: parseFloat(d[marketCapField].value),
        sector: d[sectorField].value,
        change: parseFloat(d[changeField].value)
      }));

      const width = element.clientWidth;
      const height = element.clientHeight;

      // Calculate the min and max change values
      const minChange = d3.min(stocks, d => d.change);
      const maxChange = d3.max(stocks, d => d.change);

      // Create a symmetric domain centered around 0
      const maxAbsChange = Math.max(Math.abs(minChange), Math.abs(maxChange));
      const domain = [-maxAbsChange, -maxAbsChange/2, -maxAbsChange/4, 0, maxAbsChange/4, maxAbsChange/2, maxAbsChange];

      const colorScale = d3.scaleLinear()
        .domain(domain)
        .range([
          config.color_negative_high || "#67000d",
          config.color_negative_medium || "#a50f15",
          config.color_negative_low || "#cb181d",
          config.color_neutral || "#252525",
          config.color_positive_low || "#41ab5d",
          config.color_positive_medium || "#238b45",
          config.color_positive_high || "#005a32"
        ]);

      // Group stocks by sector
      const sectorMap = d3.group(stocks, d => d.sector);
      const sectors = Array.from(sectorMap, ([name, children]) => ({name, children}));

      const treemap = d3.treemap()
        .size([width, height])
        .paddingTop(20)
        .paddingRight(1)
        .paddingBottom(1)
        .paddingLeft(1)
        .round(true);

      const root = d3.hierarchy({children: sectors})
        .sum(d => Math.log(d.marketCap)) // Using log scale for even less extreme size differences
        .sort((a, b) => b.value - a.value);

      treemap(root);

      const chart = d3.select("#stock-heatmap");
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
        .attr("width", d => d.x1 - d.x0)
        .attr("height", d => d.y1 - d.y0)
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
          let textSpace = d.x1 - d.x0 - 6;
          if (textLength > textSpace) {
            self.text(d.data.symbol.slice(0, Math.floor(d.data.symbol.length * (textSpace / textLength))) + '...');
          }
        });

      leaf.append("text")
        .attr("x", 3)
        .attr("y", d => fontSize(d) * 2 + 4)
        .text(d => d.data.change.toFixed(2) + "%")
        .attr("font-size", d => `${fontSize(d) * 0.9}px`)
        .attr("fill", "white");

      leaf.append("title")
        .text(d => `${d.data.symbol}\nSector: ${d.data.sector}\nPrice: $${d.data.price.toFixed(2)}\nMarket Cap: $${d.data.marketCap.toLocaleString()}\nChange: ${d.data.change.toFixed(2)}%`);

      // Add sector labels
      const sectors_root = root.descendants().filter(d => d.depth === 1);
      svg.selectAll(".sector")
        .data(sectors_root)
        .enter()
        .append("text")
        .attr("class", "sector")
        .attr("x", d => d.x0 + 5)
        .attr("y", d => d.y0 + 15)
        .text(d => d.data.name)
        .attr("font-size", "12px")
        .attr("font-weight", "bold")
        .attr("fill", "white")
        .each(function(d) {
          const self = d3.select(this);
          let textLength = self.node().getComputedTextLength();
          let textSpace = d.x1 - d.x0 - 10;
          if (textLength > textSpace) {
            self.text(d.data.name.slice(0, Math.floor(d.data.name.length * (textSpace / textLength))) + '...');
          }
        });

      // Add a border to each sector
      svg.selectAll(".sector-border")
        .data(sectors_root)
        .enter()
        .append("rect")
        .attr("class", "sector-border")
        .attr("x", d => d.x0)
        .attr("y", d => d.y0)
        .attr("width", d => d.x1 - d.x0)
        .attr("height", d => d.y1 - d.y0)
        .attr("fill", "none")
        .attr("stroke", "white")
        .attr("stroke-width", 1);

      // Add a legend
      const legendWidth = 200;
      const legendHeight = 20;
      const legendSvg = chart.append("svg")
        .attr("width", legendWidth)
        .attr("height", legendHeight)
        .style("position", "absolute")
        .style("top", "10px")
        .style("right", "10px");

      const gradientScale = d3.scaleLinear()
        .domain([0, 1])
        .range([domain[0], domain[domain.length - 1]]);

      const legendGradient = legendSvg.append("defs")
        .append("linearGradient")
        .attr("id", "legend-gradient")
        .attr("x1", "0%")
        .attr("y1", "0%")
        .attr("x2", "100%")
        .attr("y2", "0%");

      legendGradient.selectAll("stop")
        .data(d3.range(0, 1.1, 0.1))
        .enter().append("stop")
        .attr("offset", d => d * 100 + "%")
        .attr("stop-color", d => colorScale(gradientScale(d)));

      legendSvg.append("rect")
        .attr("width", legendWidth)
        .attr("height", legendHeight)
        .style("fill", "url(#legend-gradient)");

      legendSvg.append("text")
        .attr("x", 0)
        .attr("y", legendHeight + 15)
        .text(domain[0].toFixed(2) + "%")
        .attr("font-size", "12px")
        .attr("fill", "white");

      legendSvg.append("text")
        .attr("x", legendWidth - 40)
        .attr("y", legendHeight + 15)
        .text(domain[domain.length - 1].toFixed(2) + "%")
        .attr("font-size", "12px")
        .attr("fill", "white")
        .attr("text-anchor", "end");

    } catch (error) {
      console.error("Error in drawChart:", error);
      this.addError({ title: "Error Drawing Chart", message: error.message });
    }

    done();
  }
});
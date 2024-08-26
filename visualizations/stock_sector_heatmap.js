looker.plugins.visualizations.add({
  id: "stock_sector_heatmap",
  label: "Stock Sector Heatmap",
  options: {
    min_font_size: {
      type: "number",
      label: "Minimum Font Size",
      default: 8,
      section: "Style"
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

      const colorScale = d3.scaleLinear()
        .domain([-10, -5, -2, 0, 2, 5, 10])
        .range(["#67000d", "#a50f15", "#cb181d", "#252525", "#41ab5d", "#238b45", "#005a32"]);

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

    } catch (error) {
      console.error("Error in drawChart:", error);
      this.addError({ title: "Error Drawing Chart", message: error.message });
    }

    done();
  }
});
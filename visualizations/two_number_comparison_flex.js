looker.plugins.visualizations.add({
  options: {
    chart_title: {
      type: "string",
      label: "Chart Title",
      default: "Equity Metric Comparison"
    },
    background_color: {
      type: "string",
      label: "Background Color",
      display: "color",
      default: "#4285F4"
    },
    text_color: {
      type: "string",
      label: "Text Color",
      display: "color",
      default: "#FFFFFF"
    },
    corner_style: {
      type: "string",
      label: "Corner Style",
      display: "select",
      values: [
        {"Sharp": "0px"},
        {"Slightly Rounded": "4px"},
        {"Rounded": "8px"},
        {"Very Rounded": "16px"}
      ],
      default: "8px"
    },
    left_subtitle: {
      type: "string",
      label: "Left Subtitle",
      default: "TTM"
    },
    right_subtitle: {
      type: "string",
      label: "Right Subtitle",
      default: "Forward"
    },
    use_percentage: {
      type: "boolean",
      label: "Format as Percentage",
      default: null
    },
    decimal_places: {
      type: "number",
      label: "Decimal Places",
      default: 2,
      min: 0,
      max: 5
    }
  },

  create: function(element, config) {
    element.innerHTML = '<div id="modern-equity-viz"></div>';
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
    if (!data || data.length === 0) {
      this.addError({title: "No Data", message: "No data was returned for this visualization."});
      return;
    }

    const dimensions = queryResponse.fields.dimensions;
    if (dimensions.length < 2) {
      this.addError({title: "Insufficient Data", message: "This visualization requires at least two dimensions."});
      return;
    }

    const leftValue = parseFloat(data[0][dimensions[0].name].value);
    const rightValue = parseFloat(data[0][dimensions[1].name].value);

    if (isNaN(leftValue) || isNaN(rightValue)) {
      this.addError({title: "Invalid Data", message: "One or both of the required values are not valid numbers."});
      return;
    }

    // Detect if the data is already in percentage form
    const autoDetectedPercentage = Math.max(Math.abs(leftValue), Math.abs(rightValue)) > 1;
    
    // Use the user's setting if provided, otherwise use the auto-detected value
    const isPercentage = config.use_percentage !== null ? config.use_percentage : autoDetectedPercentage;

    const viz = d3.select(element).select("#modern-equity-viz")
      .html("")
      .style("width", "100%")
      .style("height", "100%")
      .style("background-color", config.background_color)
      .style("color", config.text_color)
      .style("font-family", "'Helvetica Neue', Arial, sans-serif")
      .style("display", "flex")
      .style("flex-direction", "column")
      .style("border-radius", config.corner_style)
      .style("overflow", "hidden")
      .style("box-sizing", "border-box")
      .style("padding", "10px");

    // Add title
    viz.append("div")
      .style("font-size", "16px")
      .style("font-weight", "bold")
      .style("text-align", "center")
      .style("margin-bottom", "10px")
      .text(config.chart_title);

    const valuesContainer = viz.append("div")
      .style("display", "flex")
      .style("justify-content", "space-around")
      .style("align-items", "center")
      .style("flex-grow", "1");

    function formatValue(value) {
      if (isPercentage) {
        return (autoDetectedPercentage ? value : value * 100).toFixed(config.decimal_places) + "%";
      } else {
        return value.toFixed(config.decimal_places);
      }
    }

    function createValueDisplay(value, label) {
      const display = valuesContainer.append("div")
        .style("text-align", "center")
        .style("flex", "1");

      display.append("div")
        .style("font-size", "24px")
        .style("font-weight", "bold")
        .text(formatValue(value));

      display.append("div")
        .style("font-size", "12px")
        .text(label);
    }

    createValueDisplay(leftValue, config.left_subtitle);
    createValueDisplay(rightValue, config.right_subtitle);

    // Make the visualization responsive
    function resize() {
      const width = element.clientWidth;
      const height = element.clientHeight;
      const fontSize = Math.min(width, height) / 10;

      viz.style("font-size", fontSize + "px");
      viz.select("div:first-child").style("font-size", (fontSize * 0.8) + "px");
      valuesContainer.selectAll("div > div:first-child").style("font-size", (fontSize * 1.5) + "px");
      valuesContainer.selectAll("div > div:last-child").style("font-size", (fontSize * 0.6) + "px");
    }

    // Call resize initially and on window resize
    resize();
    window.addEventListener("resize", resize);

    done();
  }
});
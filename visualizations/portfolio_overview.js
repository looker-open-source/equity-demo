looker.plugins.visualizations.add({
  options: {
    font_size: {
      type: "string",
      label: "Font Size",
      values: [
        {"Small": "12px"},
        {"Medium": "16px"},
        {"Large": "20px"}
      ],
      display: "select",
      default: "16px"
    },
    color_scheme: {
      type: "array",
      label: "Color Scheme",
      display: "colors",
      default: ["#27ae60", "#e74c3c"]
    }
  },

  create: function(element, config) {
    element.innerHTML = '<div id="portfolioViz"></div>';
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (data.length === 0) {
      this.addError({title: "No Results", message: "This chart requires data to render."});
      return;
    }

    // Assuming the first row contains all the data we need
    const row = data[0];

    // Expect fields in this order: original investment date, initial investment value, current investment value
    const fields = queryResponse.fields.dimensions.concat(queryResponse.fields.measures);

    if (fields.length < 3) {
      this.addError({title: "Insufficient Data", message: "Please ensure your data includes original investment date, initial investment value, and current investment value, in that order."});
      return;
    }

    const initialDate = LookerCharts.Utils.textForCell(row[fields[0].name]);
    const initialValue = parseFloat(LookerCharts.Utils.textForCell(row[fields[1].name]));
    const currentValue = parseFloat(LookerCharts.Utils.textForCell(row[fields[2].name]));

    const growthAmount = currentValue - initialValue;
    const growthPercentage = ((currentValue - initialValue) / initialValue) * 100;
    const isPositive = growthAmount >= 0;

    const formattedCurrentValue = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(currentValue);
    const formattedInitialValue = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(initialValue);
    const formattedGrowthAmount = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(Math.abs(growthAmount));

    const vizContainer = element.querySelector('#portfolioViz');
    vizContainer.style.fontFamily = 'Arial, sans-serif';
    vizContainer.style.fontSize = config.font_size;
    vizContainer.style.padding = '20px';
    vizContainer.style.backgroundColor = '#f8f9fa';
    vizContainer.style.borderRadius = '8px';
    vizContainer.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1)';

    vizContainer.innerHTML = `
      <h2 style="color: #2c3e50; margin-bottom: 20px;">Investment Portfolio Overview</h2>
      <div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
        <div>
          <p style="color: #7f8c8d; margin-bottom: 5px;">Original Investment Date</p>
          <p style="font-weight: bold; color: #2c3e50;">${initialDate}</p>
        </div>
        <div>
          <p style="color: #7f8c8d; margin-bottom: 5px;">Initial Investment Value</p>
          <p style="font-weight: bold; color: #2c3e50;">${formattedInitialValue}</p>
        </div>
      </div>
      <div style="margin-bottom: 20px;">
        <p style="color: #7f8c8d; margin-bottom: 5px;">Current Investment Value</p>
        <p style="font-weight: bold; color: #2c3e50; font-size: 1.2em;">${formattedCurrentValue}</p>
      </div>
      <div style="text-align: center; padding: 15px; background-color: ${isPositive ? config.color_scheme[0] : config.color_scheme[1]}; color: white; border-radius: 4px;">
        <p style="font-size: 1.2em; margin-bottom: 5px;">Growth</p>
        <p style="font-size: 1.5em; font-weight: bold;">
          ${isPositive ? '▲' : '▼'} ${formattedGrowthAmount} (${Math.abs(growthPercentage).toFixed(2)}%)
        </p>
      </div>
    `;

    done();
  }
});

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
      default: "16px",
      section: "Style"
    },
    corner_radius: {
      type: "number",
      label: "Corner Radius",
      default: 10,
      section: "Style"
    }
  },

  create: function(element, config) {
    element.innerHTML = `
      <style>
        .analyst-recommendation-container {
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
          overflow: hidden;
        }
        .analyst-recommendation {
          font-family: Arial, sans-serif;
          padding: 20px;
          text-align: center;
          display: flex;
          flex-direction: column;
          justify-content: space-between;
          background-color: white;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
          max-width: 90%;
          max-height: 90%;
        }
        .recommendation {
          font-weight: bold;
          padding: 10px;
          border-radius: 5px;
          margin: 10px 0;
        }
        .additional-info {
          display: flex;
          justify-content: space-around;
          flex-wrap: wrap;
        }
        .info-item {
          flex: 1 0 40%;
          margin: 5px;
          min-width: 100px;
        }
        h3, h4 {
          margin: 5px 0;
        }
      </style>
      <div class="analyst-recommendation-container">
        <div class="analyst-recommendation">
          <div>
            <h3>Analyst Recommendation:</h3>
            <div class="recommendation"></div>
          </div>
          <div class="additional-info">
            <div class="info-item">
              <h4>Recommendation Mean:</h4>
              <div class="mean"></div>
            </div>
            <div class="info-item">
              <h4>Number of Analysts:</h4>
              <div class="analysts"></div>
            </div>
          </div>
        </div>
      </div>
    `;
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (!data || data.length === 0) {
      this.addError({title: "No Data", message: "This chart requires data to render."});
      return;
    }

    const recommendationField = queryResponse.fields.dimensions.find(d => d.name.includes('key'));
    const meanField = queryResponse.fields.dimensions.find(d => d.name.includes('mean'));
    const analystsField = queryResponse.fields.dimensions.find(d => d.name.includes('analyst'));

    if (!recommendationField || !meanField || !analystsField) {
      this.addError({title: "Invalid Data", message: "This visualization requires recommendation, mean, and analysts dimensions."});
      return;
    }

    const recommendation = data[0][recommendationField.name].value;
    const mean = data[0][meanField.name].value;
    const analysts = data[0][analystsField.name].value;

    const container = element.querySelector('.analyst-recommendation');
    const recommendationElement = element.querySelector('.recommendation');
    const meanElement = element.querySelector('.mean');
    const analystsElement = element.querySelector('.analysts');

    recommendationElement.textContent = recommendation.toUpperCase();
    meanElement.textContent = mean;
    analystsElement.textContent = analysts;

    // Apply conditional formatting
    let backgroundColor, textColor;
    switch(recommendation.toLowerCase()) {
      case 'buy':
        backgroundColor = '#4CAF50';
        textColor = 'white';
        break;
      case 'hold':
        backgroundColor = '#FFC107';
        textColor = 'white';
        break;
      case 'sell':
        backgroundColor = '#F44336';
        textColor = 'white';
        break;
      default:
        backgroundColor = '#CCCCCC';
        textColor = 'black';
    }

    recommendationElement.style.backgroundColor = backgroundColor;
    recommendationElement.style.color = textColor;

    // Apply font size and corner radius from config
    container.style.fontSize = config.font_size;
    container.style.borderRadius = `${config.corner_radius}px`;

    done();
  }
});

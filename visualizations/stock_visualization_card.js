looker.plugins.visualizations.add({
  options: {
    style: {
      type: "string",
      label: "Card Style",
      display: "select",
      values: [
        {"Modern": "modern"},
        {"Minimalist": "minimalist"},
        {"Colorful": "colorful"}
      ],
      default: "modern"
    }
  },
  create: function(element, config) {
    element.innerHTML = '<div id="stock-card" style="width: 100%; height: 100%;"></div>';
    this.container = element.querySelector("#stock-card");
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (data.length === 0) {
      this.addError({title: "No Results", message: "This chart requires data to render."});
      return;
    }

    const row = data[0];
    const fields = queryResponse.fields.dimensions.concat(queryResponse.fields.measures);

    const getFieldValue = (keywords) => {
      const field = fields.find(f => keywords.some(keyword => f.name.toLowerCase().includes(keyword)));
      return field ? LookerCharts.Utils.textForCell(row[field.name]) : 'N/A';
    };

    const companyName = getFieldValue(['name', 'company']);
    const ticker = getFieldValue(['symbol', 'ticker']);
    const currentPrice = getFieldValue(['current', 'price']);
    const previousClose = getFieldValue(['previous', 'close']);

    const formatPrice = (price) => {
      if (price === 'N/A') return 'N/A';
      const cleanPrice = price.replace('$', '').trim();
      return `$${cleanPrice}`;
    };

    const baseStyles = `
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      width: 100%;
      height: 100%;
      box-sizing: border-box;
      overflow: hidden;
      font-size: 16px;
    `;

    let cardHtml = '';

    switch(config.style) {
      case 'modern':
        cardHtml = `
          <div style="${baseStyles} font-family: Arial, sans-serif; background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); border-radius: 10px; padding: 1em; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
            <h2 style="margin: 0 0 0.5em; color: #333; font-size: 1.2em;">${companyName} (${ticker})</h2>
            <div style="display: flex; justify-content: space-between; flex-grow: 1; align-items: center;">
              <div style="flex: 1;">
                <p style="margin: 0; font-size: 0.9em; color: #666;">Current Price</p>
                <p style="margin: 0.2em 0 0; font-size: 1.2em; font-weight: bold; color: #0066cc;">${formatPrice(currentPrice)}</p>
              </div>
              <div style="flex: 1; text-align: right;">
                <p style="margin: 0; font-size: 0.9em; color: #666;">Previous Close</p>
                <p style="margin: 0.2em 0 0; font-size: 1.2em; font-weight: bold; color: #666;">${formatPrice(previousClose)}</p>
              </div>
            </div>
          </div>
        `;
        break;
      case 'minimalist':
        cardHtml = `
          <div style="${baseStyles} font-family: 'Helvetica Neue', sans-serif; background: #fff; border: 1px solid #e0e0e0; padding: 1em;">
            <h3 style="margin: 0 0 0.5em; font-weight: 300; color: #333; font-size: 1.1em;">${companyName} <span style="color: #888; font-size: 0.9em;">${ticker}</span></h3>
            <div style="display: flex; justify-content: space-between; flex-grow: 1; align-items: center;">
              <div style="flex: 1;">
                <p style="margin: 0; font-size: 0.9em; color: #888;">Current</p>
                <p style="margin: 0.2em 0 0; font-size: 1.1em; color: #333;">${formatPrice(currentPrice)}</p>
              </div>
              <div style="flex: 1; text-align: right;">
                <p style="margin: 0; font-size: 0.9em; color: #888;">Previous</p>
                <p style="margin: 0.2em 0 0; font-size: 1.1em; color: #333;">${formatPrice(previousClose)}</p>
              </div>
            </div>
          </div>
        `;
        break;
      case 'colorful':
        cardHtml = `
          <div style="${baseStyles} font-family: 'Roboto', sans-serif; background: #2c3e50; color: #ecf0f1; border-radius: 10px; padding: 1em; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
            <h2 style="margin: 0 0 0.5em; color: #3498db; font-size: 1.2em;">${companyName} <span style="color: #bdc3c7; font-size: 0.9em;">${ticker}</span></h2>
            <div style="display: flex; justify-content: space-between; flex-grow: 1; align-items: center; background: #34495e; border-radius: 8px; padding: 0.8em;">
              <div style="flex: 1;">
                <p style="margin: 0; font-size: 0.9em; color: #bdc3c7;">Current Price</p>
                <p style="margin: 0.2em 0 0; font-size: 1.2em; font-weight: bold; color: #2ecc71;">${formatPrice(currentPrice)}</p>
              </div>
              <div style="flex: 1; text-align: right;">
                <p style="margin: 0; font-size: 0.9em; color: #bdc3c7;">Previous Close</p>
                <p style="margin: 0.2em 0 0; font-size: 1.2em; font-weight: bold; color: #e74c3c;">${formatPrice(previousClose)}</p>
              </div>
            </div>
          </div>
        `;
        break;
    }

    this.container.innerHTML = cardHtml;
    done();
  }
});
looker.plugins.visualizations.add({
    id: "crypto_data_card",
    label: "Crypto Data Card",
    options: {
      font_size: {
        type: "string",
        label: "Font Size",
        values: [
          {"Small": "12px"},
          {"Medium": "16px"},
          {"Large": "20px"}
        ],
        default: "16px"
      }
    },
    create: function(element, config) {
      element.innerHTML = `
        <style>
          .crypto-card {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 16px;
            max-width: 300px;
            margin: 0 auto;
          }
          .crypto-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 16px;
          }
          .crypto-price {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 8px;
          }
          .crypto-change {
            font-size: 18px;
            margin-bottom: 8px;
          }
          .crypto-market-cap {
            font-size: 14px;
            color: #666;
          }
          .positive { color: #4caf50; }
          .negative { color: #f44336; }
        </style>
        <div class="crypto-card">
          <div class="crypto-title"></div>
          <div class="crypto-price"></div>
          <div class="crypto-change"></div>
          <div class="crypto-market-cap"></div>
        </div>
      `;
    },
    updateAsync: function(data, element, config, queryResponse, details, done) {
      this.clearErrors();
  
      if (queryResponse.fields.dimensions.length < 4) {
        this.addError({title: "Invalid Data", message: "This chart requires at least 4 dimensions: ID, current price, price change percentage, and market cap."});
        return;
      }
  
      const cryptoData = data[0];
      const dimensionFields = queryResponse.fields.dimensions;
  
      let cryptoId, currentPrice, priceChange, marketCap;
  
      dimensionFields.forEach(field => {
        switch(field.name.toLowerCase()) {
          case 'id':
            cryptoId = cryptoData[field.name].value;
            break;
          case 'current_price':
            currentPrice = parseFloat(cryptoData[field.name].value);
            break;
          case 'price_change_percentage_24hr':
            priceChange = parseFloat(cryptoData[field.name].value);
            break;
          case 'market_cap':
            marketCap = parseFloat(cryptoData[field.name].value);
            break;
        }
      });
  
      if (!cryptoId || !currentPrice || priceChange === undefined || !marketCap) {
        this.addError({title: "Missing Data", message: "Please ensure all required fields (ID, current price, price change percentage, and market cap) are included."});
        return;
      }
  
      const card = element.querySelector('.crypto-card');
      card.style.fontSize = config.font_size;
  
      card.querySelector('.crypto-title').textContent = cryptoId;
      card.querySelector('.crypto-price').textContent = `$${currentPrice.toLocaleString()}`;
  
      const changeElement = card.querySelector('.crypto-change');
      changeElement.textContent = `${priceChange.toFixed(2)}%`;
      changeElement.classList.add(priceChange >= 0 ? 'positive' : 'negative');
  
      card.querySelector('.crypto-market-cap').textContent = `Market Cap: $${marketCap.toLocaleString()}`;
  
      done();
    }
  });
looker.plugins.visualizations.add({
  options: {
    font_size: {
      type: "number",
      label: "Font Size",
      default: 16,
      section: "Style",
    },
    scroll_speed: {
      type: "number",
      label: "Scroll Speed",
      default: 30,
      section: "Style",
    },
    background_color: {
      type: "string",
      label: "Background Color",
      default: "#000000",
      section: "Style",
      display: "color"
    },
    text_color: {
      type: "string",
      label: "Text Color",
      default: "#00FF00",
      section: "Style",
      display: "color"
    }
  },

  create: function(element, config) {
    element.innerHTML = `
      <style>
        .ticker-wrap {
          width: 100%;
          overflow: hidden;
          background-color: ${config.background_color || "#000000"};
          padding: 10px 0;
          white-space: nowrap;
        }
        .ticker {
          display: inline-block;
          white-space: nowrap;
          padding-right: 100%;
          animation: ticker linear infinite;
        }
        .ticker-item {
          display: inline-block;
          padding: 0 20px;
          color: ${config.text_color || "#00FF00"};
          font-family: sans-serif;
        }
        @keyframes ticker {
          0% {
            transform: translate3d(0, 0, 0);
          }
          100% {
            transform: translate3d(-100%, 0, 0);
          }
        }
      </style>
      <div class="ticker-wrap">
        <div class="ticker"></div>
      </div>
    `;

    this.ticker = element.querySelector('.ticker');
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (!queryResponse.fields.dimensions || queryResponse.fields.dimensions.length < 2) {
      this.addError({title: "Insufficient Dimensions", message: "This chart requires two dimensions: one for the ticker symbol and one for the price."});
      return;
    }

    const tickerField = queryResponse.fields.dimensions[0].name;
    const priceField = queryResponse.fields.dimensions[1].name;

    const tickerItems = data.map(row => {
      const ticker = LookerCharts.Utils.htmlForCell(row[tickerField]);
      const price = LookerCharts.Utils.htmlForCell(row[priceField]);
      return `<span class="ticker-item">${ticker}: ${price}</span>`;
    }).join('');

    this.ticker.innerHTML = tickerItems;
    this.ticker.style.animationDuration = `${config.scroll_speed || 30}s`;
    this.ticker.style.fontSize = `${config.font_size || 16}px`;

    element.querySelector('.ticker-wrap').style.backgroundColor = config.background_color || "#000000";
    element.querySelectorAll('.ticker-item').forEach(item => {
      item.style.color = config.text_color || "#00FF00";
    });

    done();
  }
});
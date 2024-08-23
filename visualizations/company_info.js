looker.plugins.visualizations.add({
  options: {
    font_size: {
      type: "string",
      label: "Font Size",
      values: [
        {"Small": "12px"},
        {"Medium": "14px"},
        {"Large": "16px"}
      ],
      default: "14px",
      section: "Style"
    },
    primary_color: {
      type: "string",
      label: "Primary Color",
      default: "#333333",
      section: "Style",
      display: "color"
    },
    secondary_color: {
      type: "string",
      label: "Secondary Color",
      default: "#666666",
      section: "Style",
      display: "color"
    },
    use_background: {
      type: "boolean",
      label: "Use Background Color",
      default: true,
      section: "Style"
    },
    background_color: {
      type: "string",
      label: "Background Color",
      default: "#f8f8f8",
      section: "Style",
      display: "color"
    }
  },

  create: function(element, config) {
    element.innerHTML = '<div class="company-overview"></div>';
  },

  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();

    if (data.length === 0) {
      this.addError({title: "No Results", message: "This chart requires at least one row of data."});
      return;
    }

    const row = data[0];
    const fields = queryResponse.fields.dimension_like;

    if (fields.length < 7) {
      this.addError({title: "Insufficient Data", message: "This visualization requires 7 dimensions in a specific order."});
      return;
    }

    const [name, description, website, employees, sector, fiscalYearEnd, industry] = fields.map(f => row[f.name]);

    const websiteUrl = website && website.value ? website.value : '#';
    const websiteDisplay = website && website.value ? website.value : 'N/A';

    const container = element.querySelector('.company-overview');
    container.innerHTML = `
      <style>
        .company-overview {
          font-family: Arial, sans-serif;
          color: ${config.primary_color};
          font-size: ${config.font_size};
          padding: 20px;
          background-color: ${config.use_background ? config.background_color : 'transparent'};
          border-radius: 8px;
          min-height: 100%;
          display: flex;
          flex-direction: column;
        }
        .company-name {
          font-size: 1.5em;
          font-weight: bold;
          margin-bottom: 10px;
        }
        .company-description {
          margin-bottom: 20px;
          line-height: 1.4;
          flex-grow: 1;
        }
        .company-website {
          color: #0066cc;
          text-decoration: none;
          margin-bottom: 20px;
          display: inline-block;
        }
        .company-website:hover {
          text-decoration: underline;
        }
        .company-details {
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          gap: 15px;
        }
        .detail-item {
          background-color: ${config.use_background ? 'white' : 'transparent'};
          padding: 10px;
          border-radius: 4px;
          box-shadow: ${config.use_background ? '0 1px 3px rgba(0,0,0,0.1)' : 'none'};
        }
        .detail-label {
          font-weight: bold;
          color: ${config.secondary_color};
          margin-bottom: 5px;
        }
      </style>
      <div class="company-name">${LookerCharts.Utils.htmlForCell(name)} Overview</div>
      <div class="company-description">${LookerCharts.Utils.htmlForCell(description)}</div>
      <a href="${websiteUrl}" class="company-website" target="_blank">${websiteDisplay}</a>
      <div class="company-details">
        <div class="detail-item">
          <div class="detail-label">Full Time Employees</div>
          <div>${LookerCharts.Utils.htmlForCell(employees)}</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">Fiscal Year Ends</div>
          <div>${LookerCharts.Utils.htmlForCell(fiscalYearEnd)}</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">Sector</div>
          <div>${LookerCharts.Utils.htmlForCell(sector)}</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">Industry</div>
          <div>${LookerCharts.Utils.htmlForCell(industry)}</div>
        </div>
      </div>
    `;

    done();
  }
});

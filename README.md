# US-China-Trade-War-Stock-Impact
An analysis of the impact of tariffs on stock returns in the electric vehicle, solar panel, and washing machine sectors in China
# U.S.-China Trade War Impact on Stock Returns in Key Sectors

### Research Proposal by Mariano De Martino

This repository contains the preliminary materials and methodology proposal for analyzing the effects of U.S. tariffs on the stock returns of Chinese companies within the electric vehicle, solar panel, and washing machine sectors. This research aims to contribute insights on how protectionist measures impact corporate performance and market stability, with implications for both investors and policymakers.

## Project Overview

### Motivation
The trade tensions between the U.S. and China mark a historic shift in global economic relations, significantly impacting trade flows and investor expectations. This analysis focuses on sectors critical to both economies and includes insights relevant to sustainability and emissions reduction policies.

### Key Research Questions
1. How have tariffs affected stock returns of Chinese companies in the targeted sectors?
2. Can protectionist measures lead to market instability and affect consumer behavior?

## Data and Methodology

### Data
- **Sectors and Companies**:
   - **Electric Vehicles**: BYD, Evergrande, BAIC Motors
   - **Solar Panels**: Risen Energy, JA Solar, LONGi Solar
   - **Washing Machines**: Midea, Haier, Hisense

### Methodology
1. **Log Returns Calculation**:
   - Construct sector-weighted indexes using market capitalization for weighting.
   
2. **Regression Model**:
   - **Dependent Variable**: Sector index (Ij).
   - **Independent Variable**: Dummy variables to capture tariff impacts.
   - **Control Variables**: USD/CNY exchange rate, Chinese interest rates (SHIF 3m), CSI 300 index, inflation, GDP growth, and sector-specific factors (e.g., oil, steel prices).

3. **Proposed Model**:
   ```markdown
   Ij = α + Dβ1 + Xβ2 + εt
## Future Work
1. **Statistical Analysis**: Testing and refining the regression model to ensure robustness.
2. **Writing and Publication**: Documenting findings and implications for submission to an academic journal.

## Goal

The primary goal of this analysis is to examine whether tariffs have had a statistically significant impact on stock returns within these key sectors. This will be indicated by evaluating if:

- **β1 ≠ 0**, showing that the introduction of tariffs had a positive or negative effect on stock returns.

## Contributing

This project is currently in the research proposal stage. Contributions in the form of feedback, additional analysis suggestions, or code optimization are welcome.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Contact Information

For questions, feedback, or collaboration inquiries, feel free to reach out to:

- **Mariano De Martino**
- Email: mariano.demartino@studbocconi.iy

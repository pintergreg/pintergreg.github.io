---
title: "Assessing Inequality in Public Transport Accessibility: A Socio-Spatial Analysis"
author: Gergő Pintér
date: 2025-03-14
type: for_students
draft: false
level: bachelor / master
tags:
  - urban mobility
  - public transport
  - inequality
  - mobility data
nocite: |
  @bokhari2024public
  @scheurer2017spatial
  @moreno2018public
---

### abstract

Public transport systems are vital for urban mobility, yet disparities in accessibility can contribute to social and economic inequalities. This study aims to evaluate the extent to which public transport accessibility influences inequality, with a particular focus on socioeconomically disadvantaged populations. By integrating geospatial analysis with socioeconomic data, this research seeks to identify disparities in transport accessibility and their broader implications.


### introduction

Public transport is a crucial component of urban infrastructure, providing mobility to millions of people worldwide. However, accessibility to public transport varies significantly across different populations, leading to potential inequalities in access to employment, education, healthcare, and other essential services [1]. Understanding how these disparities manifest and their broader social implications is essential for informing policy and planning decisions aimed at promoting equitable urban mobility [2].

### research questions

- How does public transport accessibility vary across different socioeconomic groups?
- What are the key spatial patterns of transport accessibility and inequality?
- What policy measures can be implemented to improve equitable access to public transport?

### methodology

This study will employ a mixed-methods approach, combining quantitative geospatial analysis with qualitative socio-economic assessments.
Key methodologies will include:

- Geospatial Analysis: Using GIS tools to map and analyze public transport coverage, frequency, and travel times across different urban areas
- Socioeconomic Data Integration: Overlaying transport accessibility data with demographic and economic indicators to assess correlations between accessibility and inequality.
- Case Studies: Conducting case studies in select urban regions to provide in-depth insights into lived experiences of transport inequality.
- Policy Review: Evaluating existing policies on public transport accessibility and equity to identify gaps and areas for improvement.

### expected outcomes

The study aims to:

- Identify key disparities in public transport accessibility based on socioeconomic factors.
- Provide empirical evidence on how accessibility differences contribute to broader urban inequalities.
- Recommend policy interventions to promote a more equitable public transport system.

### significance of the study

This research will contribute to urban mobility studies by offering a comprehensive assessment of accessibility-driven inequalities. By highlighting disparities and potential solutions, the findings can inform policymakers and urban planners in designing more inclusive transport systems.

This study will contribute to the discourse on transport equity and provide actionable insights to reduce accessibility-related inequalities in public transportation systems.

### the project uses open data about Helsinki

- map data from OpenStreetMap including amenities
- GTFS describing the timetable of the public transport [^hsl]
- temporal population density data describing the hourly population distribution in Helsinki [^tpdd]
- demographic data from the Finnish statistical office at postal code area level including income categories, education level and much more [^stat]
- origin destination trips from the HSL city bike service (Helsinki and Espoo) [^hsl]
- weather data from [open-meteo.com](https://open-meteo.com/)

This project requires intermediate Python (alternatively R, Julia, etc.) skills.
It is good to have experience with plotting tools (matplotlib, seaborn or ggplot2/R, Gadfly/Julia, etc.), also regarding spatial data.

[^hsl]: https://www.hsl.fi/en/hsl/open-data
[^tpdd]: https://zenodo.org/records/6106064
[^stat]: https://stat.fi/tup/paavo/paavon_aineistokuvaukset_en.html

### references

1. Pereira, Rafael HM, Tim Schwanen, and David Banister. 2017. “Distributive Justice and Equity in Transportation.” *Transport Reviews* 37 (2): 170–91.
2. Lucas, Karen. 2012. “Transport and Social Exclusion: Where Are We Now?” *Transport Policy* 20: 105–13.
3. Bokhari, Ali, and Farahnaz Sharifi. 2024. “Public Transport Inequality and Utilization: Exploring the Perspective of the Inequality Impact on Travel Choices.” *Sustainability* 16 (13): 5404.
4. Moreno-Monroy, Ana I, Robin Lovelace, and Frederico R Ramos. 2018. “Public Transport and School Location Impacts on Educational Inequalities: Insights from são Paulo.” *Journal of Transport Geography* 67: 110–18.
5. Scheurer, Jan, Carey Curtis, and Sam McLeod. 2017. “Spatial Accessibility of Public Transport in Australian Cities: Does It Relieve or Entrench Social and Economic Inequality?” *Journal of Transport and Land Use* 10 (1): 911–30.

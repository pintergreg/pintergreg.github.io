---
title: "Human mobility prediction based on mobility patterns and socioeconomic background "
author: Gergő Pintér
date: 2025-03-18
type: for_students
draft: false
level: bachelor / master
tags:
  - urban mobility
  - machine learning
  - mobility data
---

### introduction

Human mobility is a fundamental aspect of social life, influencing urban planning, transportation systems, and socioeconomic dynamics. The increasing availability of large-scale mobility data from mobile devices, GPS trackers, and social media has enabled computational social scientists to analyze and predict movement patterns with unprecedented accuracy. This project aims to develop and evaluate computational models for human mobility prediction with machine learning techniques and investigate the extent to which mobility patterns can be used for socioeconomic profiling.

### research objectives

The primary objectives of this study are:

- To develop predictive models that forecast individual and aggregate mobility trajectories.
- To analyze the relationship between mobility behavior and socioeconomic characteristics such as income levels, occupation, and access to services.
- To assess ethical considerations and biases in mobility-based socioeconomic profiling.

### methodology

This study will use large-scale mobility datasets, either open-source or synthetic, covering urban populations over an extended period. The methodology consists of three key components:

- Mobility Prediction Models: Using machine learning and deep learning approaches (e.g., recurrent neural networks, transformers), mobility trajectories will be predicted based on historical movement patterns, external factors (e.g., weather, events), and individual mobility habits.
- Socioeconomic Profiling: Mobility features such as travel distance, visited locations, commuting patterns, and social mixing will be correlated with socioeconomic indicators from census data or other sources. Techniques such as clustering and classification will be used to infer socioeconomic attributes from mobility data.
- Bias and Ethical Analysis: The potential biases in mobility-based profiling will be assessed, including disparities in data coverage, privacy risks, and ethical implications of using mobility data for socioeconomic inference.

### expected contributions

This research will contribute to:

- Improved mobility prediction models for urban applications.
- Insights into the link between movement patterns and socioeconomic status.
- Ethical guidelines for mobility-based profiling in computational social science.

### conclusion

By bridging mobility prediction with socioeconomic profiling, this study will provide valuable tools for policymakers, urban planners, and researchers, ensuring a balance between technological advancement and ethical responsibility in human mobility analysis.

### the project uses open data about Nagoya Metropolitan Area

- map data from OpenStreetMap including amenities
- YJMob100K mobility data
- demographic data from the Japanese statistical office at municipality level including taxable income, number of households, etc.
- potentially, weather data from [open-meteo.com](https://open-meteo.com/)

This project requires strong Python (alternatively R, Julia, etc.) skills.
It is good to have experience plotting tools (matplotlib, seaborn or ggplot2/R, Gadfly/Julia, etc.), and willingness to work with machine learning algorithms.

### references

1. T. Yabe et al., “HuMob Challenge 2023.” https://connection.mit.edu/humob-challenge-2023/, 2023.
2. T. Yabe et al., “YJMob100K: City-scale and longitudinal dataset of anonymized human mobility trajectories,” Scientific Data, vol. 11, no. 1, p. 397, 2024.
3. G. Pintér, “Revealing urban area from mobile positioning data,” Scientific Reports, vol. 14, no. 1, p. 30948, 2024.
4. S. Juhász et al., “Amenity complexity and urban locations of socio-economic mixing,” EPJ Data Science, vol. 12, no. 1, p. 34, 2023.
5. T. Yabe, B. García Bulle Bueno, M. R. Frank, A. Pentland, and E. Moro, “Behaviour-based dependency networks between places shape urban economic resilience,” Nature human behaviour, pp. 1–11, 2024.
6. Mishra, A. K., Cunche, M., & Arcolezi, H. H. (2025). Breaking Anonymity at Scale: Re-identifying the Trajectories of 100K Real Users in Japan. arXiv preprint [arXiv:2506.05611](https://arxiv.org/abs/2506.05611#).

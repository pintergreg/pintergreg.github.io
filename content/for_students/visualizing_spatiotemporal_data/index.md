---
title: "Artistic visualizations of spatiotemporal data: telling a story of a city with data"
author: Gergő Pintér
date: 2025-03-19
type: for_students
draft: false
level: bachelor / master
tags:
  - visualization
  - storytelling with data
  - mobility data
---

Urban mobility and city structure are complex, dynamic phenomena that can be effectively analyzed through spatiotemporal data. This project seeks to explore artistic visualizations of such data to reveal patterns of movement, spatial interactions, and urban dynamics. By blending data science with artistic design, this research will examine how visual representations can enhance our understanding of urban spaces.

With the growing significance of data science, the data visualization and data-based story-telling is also emerging.
It also utilized more and more as a part of the data journalism (e.g., [1], [2], [3]).

Data visualization is not just a tool for analysis but a powerful medium for storytelling.
By transforming raw spatiotemporal data into artistic representations, a visual narrative can communicate complex urban dynamics in a compelling and accessible manner.
Artistic visualizations can evoke emotions, provoke thought, and engage audiences in ways that traditional charts and maps cannot.
By enhancing the narrative potential of data, this research aims to bridge the gap between analytical insight and public perception, fostering a deeper understanding of urban life and mobility patterns.

This project focuses on the visualization instead deep statistical analysis of merged datasets, providing opportunity to deeply study some plotting and visualization tools.
The visualisations can be static, animated or interactive (web based), should be inclusive (prefer using colorblind friendly palettes) and, first and foremost, creative.

The expected outcome is a collection of artistic visualizations representing dynamics of a city, telling a story, utilizing mobile positioning and map data, and an assessment of how artistic visualizations enhance interpretability and engagement compared to conventional data visualizations.

Some visualisations as an inspiration:

<!-- - https://nightingaledvs.com/noisy-cities-behind-the-scenes-with-karim-douieb/ -->
- https://datastoriesceu.org/uploads/upload_en/image/application/288_pic1_n.jpg
- https://interactive.wearepossible.org/noisycities/#/?city=paris&language=en
- https://www.visualcinnamon.com/
- https://informationisbeautiful.net/wdvp/gallery-2019/
- https://plotparade.com/55_window/


### the project proposes to use open data about Helsinki

- map data from OpenStreetMap including amenities
- GTFS describing the timetable of the public transport [^hsl]
- temporal population density data describing the hourly population distribution in Helsinki [^tpdd]
- demographic data from the Finnish statistical office [^stat] at postal code area level including income categories, education level and much more
- origin destination trips from the HSL city bike service (Helsinki and Espoo) [^hsl]
- weather data from [open-meteo.com](https://open-meteo.com/)

This project requires intermediate Python (alternatively R, Julia, etc.) skills, aesthetic sense and creativeness.
It is good to have experience with spatiotemporal data and plotting packages (matplotlib, seaborn or d3.js, ggplot2/R, Gadfly/Julia, etc.).

[^hsl]: https://www.hsl.fi/en/hsl/open-data
[^tpdd]: https://zenodo.org/records/6106064
[^stat]: https://stat.fi/tup/paavo/paavon_aineistokuvaukset_en.html

### references

1. Reuters, “Live German election results,” Reuters. https://www.reuters.com/graphics/GERMANY-ELECTION/RESULTS/movaynkgova/ Reuters, 23-Feb-2025.
2. D. Bankova and M. Ovaska, “Covid swells return to Europe,” Reuters. https://www.reuters.com/graphics/HEALTH-CORONAVIRUS/EUROPE/klvyknwllvg/ Reuters, 23-Dec-2021.
3. S. A. Thompson and C. Warzel, “How to Track President Trump,” The New York Times. https://www.nytimes.com/interactive/2019/12/20/opinion/location-data-national-security.html The New York Times, 20-Dec-2019.
4. I. Meirelles, Design for information: an introduction to the histories, theories, and best practices behind effective information visualizations. 2013.
5. L. Wilkinson, The grammar of graphics, Second. Springer, 2005.

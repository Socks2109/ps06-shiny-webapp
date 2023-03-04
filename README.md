# ps06-shiny-webapp

The data was retrieved from [USGS](https://earthquake.usgs.gov/earthquakes/search/#%7B%22currentfeatureid%22%3Anull%2C%22mapposition%22%3A%5B%5B-46.58907%2C-265.56152%5D%2C%5B43.06889%2C-230.58105%5D%5D%2C%22autoUpdate%22%3A%5B%22autoUpdate%22%5D%2C%22feed%22%3A%22search_undefined%22%2C%22listFormat%22%3A%22default%22%2C%22restrictListToMap%22%3A%5B%5D%2C%22sort%22%3A%22newest%22%2C%22basemap%22%3A%22grayscale%22%2C%22overlays%22%3A%5B%22plates%22%5D%2C%22timezone%22%3A%22utc%22%2C%22viewModes%22%3A%5B%22list%22%2C%22settings%22%2C%22map%22%5D%2C%22event%22%3Anull%2C%22search%22%3A%7B%22name%22%3A%22Search%20Results%22%2C%22params%22%3A%7B%22starttime%22%3A%222000-02-15%2000%3A00%3A00%22%2C%22endtime%22%3A%222021-02-22%2023%3A59%3A59%22%2C%22maxlatitude%22%3A7.378%2C%22minlatitude%22%3A-12.281%2C%22maxlongitude%22%3A-230.098%2C%22minlongitude%22%3A-266.045%2C%22minmagnitude%22%3A6%2C%22orderby%22%3A%22time%22%7D%7D%7D). It contains the earthquake data over the past 30 days in the conterminous U.S. and has the following variables:

- time: in UTC
- latitude: decimal degrees, north positive
- longitude: decimal degrees, east positive
- depth: depth of event, km
- mag: magnitude
- magType: method use to compute mag
- nst: number of stations used to determine the location
- gap: The largest azimuthal gap between azimuthally adjacent stations (in degrees).
- dmin: Horizontal distance from the epicenter to the nearest station (in degrees)
- rms: The root-mean-square (RMS) travel time residual, in sec, using all weights
- net: The ID of a data contributor.
- id: A unique identifier for the event.
- updated: Time when the event was most recently updated.
- place: Textual description of named geographic region near to the event.
- type: Type of seismic event.
- horizontalError: Uncertainty of reported location of the event in kilometers.
- depthError: Uncertainty of reported depth of the event in kilometers.
- magError: Uncertainty of reported magnitude of the event. The estimated standard error of the magnitude.
- magNst: The total number of seismic stations used to calculate the magnitude for this earthquake.
- status: Indicates whether the event has been reviewed by a human.
locationSource: The network that originally authored the reported location of this event.
magSource: Network that originally authored the reported magnitude for this event.

For more detailed explanation of the variables, please visit the [USGS site](https://earthquake.usgs.gov/earthquakes/search/#%7B%22currentfeatureid%22%3Anull%2C%22mapposition%22%3A%5B%5B-46.58907%2C-265.56152%5D%2C%5B43.06889%2C-230.58105%5D%5D%2C%22autoUpdate%22%3A%5B%22autoUpdate%22%5D%2C%22feed%22%3A%22search_undefined%22%2C%22listFormat%22%3A%22default%22%2C%22restrictListToMap%22%3A%5B%5D%2C%22sort%22%3A%22newest%22%2C%22basemap%22%3A%22grayscale%22%2C%22overlays%22%3A%5B%22plates%22%5D%2C%22timezone%22%3A%22utc%22%2C%22viewModes%22%3A%5B%22list%22%2C%22settings%22%2C%22map%22%5D%2C%22event%22%3Anull%2C%22search%22%3A%7B%22name%22%3A%22Search%20Results%22%2C%22params%22%3A%7B%22starttime%22%3A%222000-02-15%2000%3A00%3A00%22%2C%22endtime%22%3A%222021-02-22%2023%3A59%3A59%22%2C%22maxlatitude%22%3A7.378%2C%22minlatitude%22%3A-12.281%2C%22maxlongitude%22%3A-230.098%2C%22minlongitude%22%3A-266.045%2C%22minmagnitude%22%3A6%2C%22orderby%22%3A%22time%22%7D%7D%7D)

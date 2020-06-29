# Homework

Add this array of objects to your server

```js
const myCities = [
    {id:1, cityName: "Valencia", country:"Spain", latitude:39.46, longitude:-0.37, weather:28.5 },
    {id:2, cityName: "Paris", country:"Spain", latitude:48.85, longitude:2.27, weather:24.5 },
    {id:3, cityName: "Estambul", country:"Turkey", latitude:41.04, longitude:28.99, weather:34.5 },
    {id:4, cityName: "Tokyo", country:"Japan", latitude:35.50, longitude:138.64, weather:29.5 },
];
```

And develop the next endpoints (cityName, countryName,cityId latitude and longitude are variables):
- / : will respond an array of objects with the name and the weather
- /city/:cityName : giving the name will respond an object with the name and the weather 
- /city?name=cityName: giving the name will respond an object with the name and the weather 
- /city?lat=latitude&lon=longitude: giving the latitude and longitude will respond an object with the name and the weather 
- /city?id=cityId: giving the name will respond an object with the name and the weather 
- /country/:countryName : giving the name of a country will respond an array of objects with the name and the weather
- /city/search/:text : giving the string text, will respond an array of objects with the name and the weather of those cities that the cityName includes the string

Then, add a logger and control of errors to each endpoint


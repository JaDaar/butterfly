class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived_temperature = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temperature,
      this.perceived_temperature, this.pressure, this.humidity);

  Weather.fromJson(Map<String,dynamic> weatherMap){
    this.name=weatherMap['name'];
    this.temperature=(weatherMap['main']['temp'] * (9/5)-459.67)??0; // is in Kelvin, convert to Fahrenheit
    //this.temperature=(weatherMap['main']['temp'] - 273.15)??0; // is in Kelvin, convert to Celsius
    this.perceived_temperature=(weatherMap['main']['feels_like'] * (9/5)-459.67)??0; // is in Kelvin, convert to Fahrenheit
    this.pressure=weatherMap['main']['pressure']??0;
    this.humidity=weatherMap['main']['humidity']??0;
    this.description=weatherMap['weather'][0]['main']??'';
  }
}

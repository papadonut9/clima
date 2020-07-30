import 'package:clima/dependencies.dart';

class WeatherModel {
  
  Future<dynamic> getCity(String cityName) async {
    var url =
        '$openWeatherMapURL?q=$cityName&appid=$kAPIKey&units=$measurementSystem';
    ConnectionHelper connectionHelper = ConnectionHelper(url);
    var weatherData = await connectionHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeather() async {
    Location location = Location(); //object declared for location

    await location
        .getCurrentLocation(); //awaiting to get location in background.
    // _latitudeX = location.getLatitude(); // Get Latitude of current location.
    // _longitudeX = location.getLongitude(); // Get Longitude of current location.
    // getData();
    ConnectionHelper connectionHelper = ConnectionHelper(
        '$openWeatherMapURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$kAPIKey&units=$measurementSystem');
    var weatherData = await connectionHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

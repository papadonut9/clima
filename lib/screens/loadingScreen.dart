import 'package:clima/dependencies.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // double _latitudeX;
  // double _longitudeX;
  void getLocationData() async {
    // WeatherModel weatherModel = WeatherModel();
    var weatherData = await WeatherModel().getWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  @override
  void initState() {
    // if you don't get this, see "Flutter Widget lifecycle".
    super.initState();
    getLocationData(); // obtains location while widget is "Hot Restarted!"
  }

  @override
  Widget build(BuildContext context) {
    // getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

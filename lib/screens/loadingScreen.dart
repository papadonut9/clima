import 'package:clima/dependencies.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _latitudeX;
  double _longitudeX;
  void getLocationData() async {
    Location location = Location(); //object declared for location

    await location
        .getCurrentLocation(); //awaiting to get location in background.
    _latitudeX = location.getLatitude(); // Get Latitude of current location.
    _longitudeX = location.getLongitude(); // Get Longitude of current location.
    // getData();
    ConnectionHelper connectionHelper = ConnectionHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_latitudeX&lon=$_longitudeX&appid=$kAPIKey&units=metric');
    var weatherData = await connectionHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
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

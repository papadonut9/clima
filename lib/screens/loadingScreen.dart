import 'package:clima/dependencies.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location(); //object declared

    await location
        .getCurrentLocation(); //awaiting to get location in background.
    double _latitudeX =
        location.getLatitude(); // Get Latitude of current location.
    double _longitudeX =
        location.getLongitude(); // Get Longitude of current location.

    print('Latitude: $_latitudeX.');
    print('Longitude: $_longitudeX');
  }

  @override
  void initState() {
    super.initState();
    getLocation(); // obtain location while widget is built
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

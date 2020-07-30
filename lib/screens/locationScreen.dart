import 'package:clima/dependencies.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String weatherEmoji;
  String cityName;
  String message;
  String extMessage;

  @override
  void initState() {
    super.initState();
    uiUpdate(widget.locationWeather);
  }

  void uiUpdate(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherEmoji = 'Error!!';
        extMessage = 'Sorry, I can\'t provide weather at the moment.';
        cityName = '';
        return;
      }
      // FIXME: temperaturex throwing out a stack trace when temperature is a perfect integer.
      var temperaturex = weatherData['main']['temp']; // main.temp
      temperature = temperaturex.toInt();
      // int temperatureInt = temperaturex.toInt();
      int condition = weatherData['weather'][0]['id']; //  weather[0].id
      weatherEmoji = weatherModel.getWeatherIcon(condition);
      cityName = weatherData['name'];
      if (cityName == 'Konkan Division') {
        cityName = 'Mumbai';
      }else{
        cityName = weatherData['name'];
      }
      message = weatherModel.getMessage(temperature);
      extMessage = '$message in $cityName!';
    });
    // print(cityName);
    // print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getWeather();
                      uiUpdate(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedInput = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      // print(typedInput);
                      if (typedInput !=  null)  {
                        var weatherData = await weatherModel.getCity(typedInput);
                        uiUpdate(weatherData);
                        // print(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherEmoji',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  extMessage,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

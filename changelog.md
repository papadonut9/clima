# **Clima ☁**

## Nothing but just a weather app.

### Changelog:

- **v0.0.1_build-0(Alpha)**

  - Initaited repo.
  - Updated Loading Screen UI.
  - Indexed and added dependencies in single `dependencies.dart`.

- **v0.0.1_build-1(Alpha)**
  - Updated assets.
  - Updated CityScreen UI.

- **v0.0.1_build-2(Alpha)**
  - Updated Loaction UI

- **v0.0.2_build-3(Alpha)**
  - Refactored code to black box the location service.
  - Updated ```AndroidManifest.xml```(Android) and ```Info.plist```(iOS) to get the location permission from user.
  - Updated names of screens ```loading.dart``` and ```location.dart``` to ```loadingScreen.dart``` and ```locationScreen.dart``` respectively to prevent any confusion.
  - >I won't be releasing a build for this version. It'd be released on a major release.

- **v0.0.2_build-4(Alpha)**
  - Updated Changelog

- **v0.0.2_build-4(Alpha)**
  - Added functionality for http request interpretation

- **v0.1.0_build-5(beta)**
  - Added ability to access weather data from [OpenWeatherMap](https://openweathermap.org).

  - Since this is a access only app, I've used **free API**.

  - Improved code refactoring.

  - You are still unable to access the weather screen. But the app works in backend and gives console output.

- **v1.0.0_build-6(Stable)**
  - Updated Weather UI.
  - Now it shows the weather along with the condition, which is displayed by an emoji after temperature.
  - Since I live in a region where metric system is followed, I've used celcius as a unit of measurement. And the API can provide only one at a time.
  I'll include temperatures in Fahrenheit in a future update along with weather data dating back 5 days.
  - Added loading screen animation using the ```flutter_spinkit``` package.
import 'package:clima_mvvm_provider/utils/location.dart';
import 'package:clima_mvvm_provider/utils/webservice.dart';
import 'package:clima_mvvm_provider/base/base_viewmodel/base_viewmodel.dart';
import 'package:clima_mvvm_provider/utils/weather.dart';
import 'package:clima_mvvm_provider/utils/state.dart';

const apiKey = 'fc471e7559aa20b50d2e3a05ee03251b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class LocationViewModel extends BaseModel {
  LocationViewModel({required NetworkHelper api}) : super(api: api);

  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMessge;
  WeatherModel weather = WeatherModel();
  NetworkHelper networkHelper = NetworkHelper();
  Location location = Location();

  Future<void> getCurrentWeatherData() async {
    setState(ViewState.Busy);
    await location.getCurrentLocation();
    print('latitude = ${location.latitude}');
    print('longitude = ${location.longitude}');
    var weatherData = await networkHelper.getData(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    updateUI(weatherData);

    setState(ViewState.Idle);
  }

  Future<dynamic> getCityWeather(String cityName) async {
    setState(ViewState.Busy);
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    var weatherData = await networkHelper.getData(url);
    updateUI(weatherData);
    setState(ViewState.Idle);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessge = 'Unable to get Weather data';
      cityName = '';
      return;
    }

    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessge = weather.getMessage(temperature!);
    cityName = weatherData['name'];
    print(temperature);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

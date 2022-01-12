import 'package:clima_mvvm_provider/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:clima_mvvm_provider/base/baseView/base_view.dart';
import 'package:clima_mvvm_provider/location_main/viewmodel/location_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_mvvm_provider/utils/constants.dart';
import 'package:clima_mvvm_provider/utils/state.dart';
import 'package:clima_mvvm_provider/utils/route_paths.dart';
import 'package:clima_mvvm_provider/city_main/view/city_view.dart';

class LocactionView extends StatelessWidget {
  // const LocactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LocationViewModel>(
      model: LocationViewModel(api: Provider.of(context)),
      onModelReady: (model) async {
        print('onModelReady 1');
        await model.getCurrentWeatherData();
        Api api = Api();
        Version reply = await api.getPlatformVersion();
        print('reply = ${reply.string}');
        print('onModelReady 2');
      },
      builder: (context, model, child) {
        return Scaffold(
          body: model.state == ViewState.Busy
              ? _loadLocationView(context)
              : _locationView(context),
        );
      },
    );
  }

  Widget _loadLocationView(BuildContext context) {
    return const Center(
        child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100,
    ));
  }

  Widget _locationView(BuildContext context) {
    var model = Provider.of<LocationViewModel>(context);
    print('_locationView');
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/location_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop),
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
                    model.getCurrentWeatherData();
                  },
                  child: Icon(
                    Icons.near_me,
                    size: 50.0,
                  ),
                ),
                FlatButton(
                  onPressed: () async {
                    var typedName =
                        await Navigator.of(context).pushNamed(RoutePaths.CITY);
                    print('typedName = $typedName');
                    if (typedName != null) {
                      model.getCityWeather('$typedName');
                      // var weatherData = await weather.getCityWeather(typedName);
                      // updateUI(weatherData);
                    }
                  },
                  child: Icon(
                    Icons.location_city,
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
                    '${model.temperature}°',
                    style: kTempTextStyle,
                  ),
                  Text(
                    '${model.weatherIcon}',
                    style: kConditionTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: Text(
                "${model.weatherMessge} in ${model.cityName}",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

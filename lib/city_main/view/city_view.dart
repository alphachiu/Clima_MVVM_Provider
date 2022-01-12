import 'package:flutter/material.dart';
import 'package:clima_mvvm_provider/city_main/viewmodel/city_viewmodel.dart';
import 'package:clima_mvvm_provider/base/baseView/base_view.dart';
import 'package:provider/provider.dart';
import 'package:clima_mvvm_provider/utils/constants.dart';

class City_View extends StatelessWidget {
  //  City_View({Key? key}) : super(key: key);

  final cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<CityViewModel>(
      onModelReady: (model) async {
        // model.loadData();
      },
      model: CityViewModel(api: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text('Find City'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: FlatButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //       size: 50.0,
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldInputDecoration,
                    controller: cityTextController,
                    // onChanged: (value) {
                    //   print(value);
                    //   cityName = value;
                    // },
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityTextController.text);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

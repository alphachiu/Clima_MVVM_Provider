import 'package:flutter/material.dart';
import 'package:clima_mvvm_provider/base/base_viewmodel/base_viewmodel.dart';
import 'package:clima_mvvm_provider/utils/webservice.dart';

class CityViewModel extends BaseModel {
  CityViewModel({required NetworkHelper api}) : super(api: api);

  String? cityName;

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:clima_mvvm_provider/utils/webservice.dart';
import 'package:clima_mvvm_provider/utils/state.dart';

class BaseModel extends ChangeNotifier {
  NetworkHelper api;
  bool disposed = false;

  BaseModel({required NetworkHelper api}) : api = api;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}

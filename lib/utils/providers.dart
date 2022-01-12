import 'package:clima_mvvm_provider/utils/webservice.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider(create: (_) => NetworkHelper()),
];

List<SingleChildWidget> dependentServices = [];

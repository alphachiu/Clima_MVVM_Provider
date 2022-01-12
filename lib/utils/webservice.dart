import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper();

  Future getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    print('response = ${response.statusCode}');
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

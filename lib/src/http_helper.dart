import 'package:http/http.dart' as http;

class HttpHelper {
  var api = 'https://api.tap.company/v2';
  final headers;

  HttpHelper(this.headers);

  Future<http.Response> get(method) async {
    var response = await http.get('$api/$method', headers: headers);

    return response;
  }

  Future<http.Response> init() async {
    var response = await http.get('$api/init', headers: headers);

    return response;
  }
}

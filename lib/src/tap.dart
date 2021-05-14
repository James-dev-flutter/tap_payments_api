import 'dart:convert';

import 'package:http/http.dart';
import 'package:tap_payments_api/src/http_helper.dart';

class TapPayments {
  final _privateKey, _bundleId;

  String _publicKey;
  HttpHelper httpHelper;

  /// [key] is required for use this package
  TapPayments(this._privateKey, this._bundleId) {
    httpHelper = HttpHelper({
      'Authorization': 'Bearer $_privateKey',
      'application': 'app_id=$_bundleId'
    });
  }

  /// return a public key from server to encrypt cards informations
  /// if public key not null return previos public key loaded
  Future<String> getPublicKey() async {
    if (_publicKey == null) {
      await httpHelper.init().then((Response response) {
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);

          if (body['status'] == 'success') {
            _publicKey = (body['data']['encryption_key']);

            _publicKey = _publicKey
                .replaceAll('-----BEGIN PUBLIC KEY-----', '')
                .replaceAll('-----END PUBLIC KEY-----', '')
                .replaceAll('\n', '');

            return _publicKey;
          } else {
            print('TAP_API_ERROR: Public key is null');
          }
        }
      });
    }
    return _publicKey;
  }
}

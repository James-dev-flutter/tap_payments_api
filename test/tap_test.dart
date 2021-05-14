import 'package:flutter_test/flutter_test.dart';
import 'package:tap_payments_api/src/tap.dart';

Future<void> main() async {
  test('public key from tap api server is not null', () async {
    TapPayments tapPayments = TapPayments('apiSecretKey', 'bundleId');

    String publicKey = await tapPayments.getPublicKey();

    expect(publicKey, isNotNull);
  });
}

import 'package:tap_payments_api/src/tap.dart';

main() async {
  /// Create an instace of TapPayments with your api key and your bundle app id
  TapPayments tapPayments = TapPayments('apiSecretKey', 'bundleId');

  /// Generate a public key from tap api server to encrypt cards informations
  String publicKey = await tapPayments.getPublicKey();

  print(publicKey);
}

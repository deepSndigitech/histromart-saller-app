//============= jaguar_jwt for token, header for post request ==================
import 'package:jaguar_jwt/jaguar_jwt.dart';
import '../Helper/Constant.dart';

String getToken() {
  final claimSet = JwtClaim(
    issuer: issuerName,
    maxAge: const Duration(days: 365),
  );

  String token = issueJwtHS256(claimSet, jwtKey);

  print("token****$token");
  return token;
}

Map<String, String> get headers => {
      "Authorization": 'Bearer ${getToken()}',
    };

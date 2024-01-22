import '../Helper/ApiBaseHelper.dart';
import '../Widget/api.dart';

class ZipcodeRepository {
  // for add faqs.
  static Future<Map<String, dynamic>> setZipCode() async {
    try {
      var parameter = {};
      var zipCodeDetail =
          await ApiBaseHelper().postAPICall(getZipcodesApi, parameter);

      return zipCodeDetail;
    } on Exception {
      throw ApiException('Something went wrong');
    }
  }
}

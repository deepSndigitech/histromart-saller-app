import 'package:flutter/material.dart';
import '../Model/ZipCodesModel/ZipCodeModel.dart';
import '../Repository/zipcodeRepositry.dart';
import '../Screen/AddProduct/Add_Product.dart';
import '../Screen/EditProduct/EditProduct.dart';

class ZipcodeProvider extends ChangeNotifier {
  String errorMessage = '';

  Future<bool> setZipCode(bool fromAddProduct) async {
    try {
      var result = await ZipcodeRepository.setZipCode();
      bool error = result['error'];
      errorMessage = result['message'];
      if (!error) {
        var data = result['data'];
        if (fromAddProduct) {
          addProvider!.zipSearchList = (data as List)
              .map((data) => ZipCodeModel.fromJson(data))
              .toList();
        } else {
          editProvider!.zipSearchList.clear();
          editProvider!.zipSearchList = (data as List)
              .map((data) => ZipCodeModel.fromJson(data))
              .toList();
        }
      }
      return error;
    } catch (e) {
      errorMessage = e.toString();
      return true;
    }
  }
}

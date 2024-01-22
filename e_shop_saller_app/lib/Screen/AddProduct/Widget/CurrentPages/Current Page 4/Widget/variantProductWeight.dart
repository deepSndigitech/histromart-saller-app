import 'package:flutter/material.dart';
import '../../../../../../Helper/Color.dart';
import '../../../../../../Helper/Constant.dart';
import '../../../../../../Provider/settingProvider.dart';
import '../../../../../../Widget/validation.dart';
import '../../../../Add_Product.dart';
import '../../../getCommanWidget.dart';

class VariantProductWeight extends StatelessWidget {
  int pos;

  VariantProductWeight({
    Key? key,
    required this.pos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getPrimaryCommanText(getTranslated(context, "Weight (kg)")!, true),
          Container(
            width: width * 0.4,
            height: height * 0.06,
            padding: const EdgeInsets.only(),
            child: TextFormField(
              keyboardType: TextInputType.number,
              initialValue: addProvider!.variationList[pos].weight ?? '',
              style: const TextStyle(
                color: black,
                fontWeight: FontWeight.normal,
              ),
              textInputAction: TextInputAction.next,
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (String? value) {
                addProvider!.variationList[pos].weight = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: grey1,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 40, maxHeight: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: grey2),
                  borderRadius: BorderRadius.circular(circularBorderRadius7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: lightWhite),
                  borderRadius: BorderRadius.circular(circularBorderRadius8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/CurrentPages/Current%20Page%204/Widget/variantProductBreadth.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/CurrentPages/Current%20Page%204/Widget/variantProductHeight.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/CurrentPages/Current%20Page%204/Widget/variantProductLength.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/CurrentPages/Current%20Page%204/Widget/variantProductSpecialPrice.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/CurrentPages/Current%20Page%204/Widget/variantProductWeight.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/CurrentPages/Current%20Page%204/Widget/varintProductPrice.dart';
import '../../../../../../Helper/Color.dart';
import '../../../../../../Helper/Constant.dart';
import '../../../../../../Provider/settingProvider.dart';
import '../../../../../../Widget/validation.dart';
import '../../../../Add_Product.dart';
import '../../../Dialogs/variantStockStatusDialog.dart';
import '../../../ImagesWidgets.dart';
import '../../../getCommanWidget.dart';

selectionPossitionTwo(
  BuildContext context,
  Function setState,
) {
  return addProvider!.curSelPos == 2 && addProvider!.variationList.isNotEmpty
      ? ListView.builder(
          itemCount: addProvider!.row,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(circularBorderRadius5),
                  border: Border.all(
                    color:grey1,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                ),
                child: ExpansionTile(
                  textColor: Colors.green,
                  title: Row(
                    children: [
                      for (int j = 0; j < col; j++)
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              addProvider!.variationList[i].attr_name!
                                  .split(',')[j],
                              style:  const TextStyle(
                                color: lightBlack2,
                              ),
                            ),
                          ),
                        ),
                      InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.close,
                            color: lightBlack2,
                          ),
                        ),
                        onTap: () {
                          addProvider!.variationList.removeAt(i);
                          addProvider!.row = addProvider!.row - 1;
                          setState();
                        },
                      ),
                    ],
                  ),
                  children: <Widget>[
                    Column(
                      children: _buildExpandableContent(i, context, setState),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      : Container();
}

_buildExpandableContent(int pos, BuildContext context, Function setState) {
  List<Widget> columnContent = [];

  columnContent.add(
    VariantProductPrice(pos: pos),
  );
  columnContent.add(
    VariantProductSpecialPrice(pos: pos),
  );
  columnContent.add(
    VariantProductWeight(pos: pos),
  );
  columnContent.add(
    VariantProductHeight(pos: pos),
  );
  columnContent.add(
    VariantProductBreadth(pos: pos),
  );
  columnContent.add(
    VariantProductLength(pos: pos),
  );

  columnContent.add(addProvider!.productType == 'variable_product' &&
          addProvider!.variantStockLevelType == "variable_level" &&
          addProvider!.isStockSelected != null &&
          addProvider!.isStockSelected == true
      ? Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            variableVariableSKU(pos, context),
            variantVariableTotalstock(pos, context),
            getPrimaryCommanText(
                getTranslated(context, "Stock Status :")!, true),
            variantStockStatusSelect(pos, context, setState)
          ],
        )
      : Container());

  columnContent.add(otherImages("variant", pos, context, setState));

  columnContent.add(variantOtherImageShow(pos, setState));
  return columnContent;
}

variantStockStatusSelect(int pos, BuildContext context, Function setState) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      child: Container(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 5,
          right: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circularBorderRadius10),
          border: Border.all(
            color: lightBlack,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    addProvider!.variationList[pos].stockStatus == '1'
                        ? getTranslated(context, "In Stock")!
                        : getTranslated(context, "Out Of Stock")!,
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: primary,
            )
          ],
        ),
      ),
      onTap: () {
        variantStockStatusDialog("variable", pos, context, setState);
      },
    ),
  );
}

variantVariableTotalstock(int pos, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getPrimaryCommanText(getTranslated(context, "Total Stock")!, true),
        Container(
          width: width * 0.4,
          height: height * 0.06,
          padding: const EdgeInsets.only(),
          child: TextFormField(
            keyboardType: TextInputType.number,
            initialValue: addProvider!.variationList[pos].stock ?? '',
            style: const TextStyle(
              color: fontColor,
              fontWeight: FontWeight.normal,
            ),
            focusNode: addProvider!.variountProductTotalStockFocus,
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              addProvider!.variationList[pos].stock = value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor:  grey1,
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

Widget variableVariableSKU(int pos, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getPrimaryCommanText(getTranslated(context, "SKU")!, true),
        Container(
          width: width * 0.4,
          height: height * 0.06,
          padding: const EdgeInsets.only(),
          child: TextFormField(
            onFieldSubmitted: (v) {
              FocusScope.of(context)
                  .requestFocus(addProvider!.variountProductSKUFocus);
            },
            initialValue: addProvider!.variationList[pos].sku ?? '',
            style: const TextStyle(
              color: fontColor,
              fontWeight: FontWeight.normal,
            ),
            focusNode: addProvider!.variountProductSKUFocus,
            textInputAction: TextInputAction.next,
            onChanged: (String? value) {
              addProvider!.variationList[pos].sku = value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor:  grey1,
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

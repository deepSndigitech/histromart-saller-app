import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sellermultivendor/Screen/AddProduct/Widget/getCommonSwitch.dart';
import '../../../../../../Helper/Color.dart';
import '../../../../../../Helper/Constant.dart';
import '../../../../../../Widget/validation.dart';
import '../../../../../MediaUpload/Media.dart';
import '../../../../Add_Product.dart';
import '../../../getCommanBtn.dart';
import '../../../getCommanInputTextFieldWidget.dart';
import '../../../getCommanWidget.dart';
import '../../../getIconSelectionDesingWidget.dart';

selectionPossitionZero(
  BuildContext context,
  Function setState,
  Function updateCity,
) {
  return addProvider!.curSelPos == 0
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCommanSizedBox(),
            getPrimaryCommanText(
                getTranslated(context, "Type Of Product")!, false),
            getCommanSizedBox(),
            getIconSelectionDesing(
              getTranslated(context, "Select Type")!,
              9,
              context,
              setState,
              updateCity,
            ),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: getPrimaryCommanText(
                            getTranslated(context, "PRICE_LBL")!, true),
                      ),
                      Expanded(
                        flex: 3,
                        child: getCommanInputTextField(
                          "",
                          10,
                          0.06,
                          1,
                          3,
                          context,
                        ),
                      ),
                    ],
                  )
                : Container(),
            // For Simple Product
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),

            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Special Price")!, true),
                      ),
                      Expanded(
                        flex: 3,
                        child: getCommanInputTextField(
                          " ",
                          11,
                          0.06,
                          1,
                          3,
                          context,
                        ),
                      ),
                    ],
                  )
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Weight (kg)")!, true),
                      ),
                      Expanded(
                        flex: 3,
                        child: getCommanInputTextField(
                          " ",
                          20,
                          0.06,
                          1,
                          3,
                          context,
                        ),
                      ),
                    ],
                  )
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Height (cms)")!, true),
                      ),
                      Expanded(
                        flex: 3,
                        child: getCommanInputTextField(
                          " ",
                          21,
                          0.06,
                          1,
                          3,
                          context,
                        ),
                      ),
                    ],
                  )
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Breadth (cms)")!, true),
                      ),
                      Expanded(
                        flex: 3,
                        child: getCommanInputTextField(
                          " ",
                          22,
                          0.06,
                          1,
                          3,
                          context,
                        ),
                      ),
                    ],
                  )
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Length (kg)")!, true),
                      ),
                      Expanded(
                        flex: 3,
                        child: getCommanInputTextField(
                          " ",
                          23,
                          0.06,
                          1,
                          3,
                          context,
                        ),
                      ),
                    ],
                  )
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Enable Stock Management")!,
                            true),
                      ),
                      Expanded(
                        flex: 2,
                        child: CheckboxListTile(
                          value: addProvider!.isStockSelected ?? false,
                          onChanged: (bool? value) {
                            addProvider!.isStockSelected = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),
            addProvider!.productType == 'variable_product'
                ? Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: getPrimaryCommanText(
                            getTranslated(context, "Enable Stock Management")!,
                            true),
                      ),
                      Expanded(
                        flex: 2,
                        child: CheckboxListTile(
                          value: addProvider!.isStockSelected ?? false,
                          onChanged: (bool? value) {
                            addProvider!.isStockSelected = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),

            addProvider!.isStockSelected != null &&
                    addProvider!.isStockSelected == true &&
                    addProvider!.productType == 'simple_product'
                ? Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                getTranslated(context, "SKU")!, true),
                          ),
                          Expanded(
                            flex: 3,
                            child: getCommanInputTextField(
                              " ",
                              12,
                              0.06,
                              1,
                              2,
                              context,
                            ),
                          ),
                        ],
                      ),
                      getCommanSizedBox(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                getTranslated(context, "Total Stock")!, true),
                          ),
                          Expanded(
                            flex: 3,
                            child: getCommanInputTextField(
                              " ",
                              13,
                              0.06,
                              1,
                              3,
                              context,
                            ),
                          ),
                        ],
                      ),
                      getCommanSizedBox(),
                      getIconSelectionDesing(
                          getTranslated(context, "Select Stock Status")!,
                          10,
                          context,
                          setState,
                          updateCity),
                    ],
                  )
                : Container(),

            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.productType == 'simple_product'
                ? getCommonButtonAdd(getTranslated(context, "Save Settings")!,
                    4, setState, context)
                : Container(),

            // varible product
            addProvider!.isStockSelected != null &&
                    addProvider!.isStockSelected == true &&
                    addProvider!.productType == 'variable_product'
                ? getPrimaryCommanText(
                    getTranslated(context, "Choose Stock Management Type")!,
                    false)
                : Container(),
            addProvider!.productType == 'variable_product'
                ? getCommanSizedBox()
                : Container(),
            addProvider!.isStockSelected != null &&
                    addProvider!.isStockSelected == true &&
                    addProvider!.productType == 'variable_product'
                ? getIconSelectionDesing(
                    getTranslated(context, "Select Stock Status")!,
                    11,
                    context,
                    setState,
                    updateCity)
                : Container(),
            addProvider!.productType == 'variable_product' &&
                    addProvider!.variantStockLevelType == "product_level" &&
                    addProvider!.isStockSelected != null &&
                    addProvider!.isStockSelected == true
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCommanSizedBox(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                getTranslated(context, "SKU")!, true),
                          ),
                          Expanded(
                            flex: 3,
                            child: getCommanInputTextField(
                              " ",
                              14,
                              0.06,
                              1,
                              2,
                              context,
                            ),
                          ),
                        ],
                      ),
                      getCommanSizedBox(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                getTranslated(context, "Total Stock")!, true),
                          ),
                          Expanded(
                            flex: 3,
                            child: getCommanInputTextField(
                              " ",
                              15,
                              0.06,
                              1,
                              3,
                              context,
                            ),
                          ),
                        ],
                      ),
                      getPrimaryCommanText("Stock Status", false),
                      getCommanSizedBox(),
                      getIconSelectionDesing(
                          getTranslated(context, "Select Stock Status")!,
                          12,
                          context,
                          setState,
                          updateCity),
                    ],
                  )
                : Container(),
            getCommanSizedBox(),
            getCommanSizedBox(),
            addProvider!.productType == 'variable_product' &&
                    addProvider!.variantStockLevelType == "product_level"
                ? getCommonButtonAdd(getTranslated(context, "Save Settings")!,
                    5, setState, context)
                : Container(),

            addProvider!.productType == 'variable_product' &&
                    addProvider!.variantStockLevelType == "variable_level"
                ? getCommonButtonAdd(getTranslated(context, "Save Settings")!,
                    6, setState, context)
                : Container(),

            //Digital Product

            addProvider!.productType == 'digital_product'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                getTranslated(context, "PRICE_LBL")!, true),
                          ),
                          Expanded(
                            flex: 3,
                            child: getCommanInputTextField(
                              " ",
                              17,
                              0.06,
                              1,
                              3,
                              context,
                            ),
                          ),
                        ],
                      ),
                      getCommanSizedBox(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                getTranslated(context, "Special Price")!, true),
                          ),
                          Expanded(
                            flex: 3,
                            child: getCommanInputTextField(
                              " ",
                              18,
                              0.06,
                              1,
                              3,
                              context,
                            ),
                          ),
                        ],
                      ),
                      getCommanSizedBox(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getPrimaryCommanText(
                                "Is Download allowed?", true),
                          ),
                          getCommanSwitch(5, setState),
                        ],
                      ),
                      getCommanSizedBox(),
                      addProvider!.digitalProductDownloaded
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getPrimaryCommanText(
                                    'Download Link Type', false),
                                getCommanSizedBox(),
                                getIconSelectionDesing(
                                  "None",
                                  14,
                                  context,
                                  setState,
                                  setState,
                                ),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Self Hosted'
                                    ? getCommanSizedBox()
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Self Hosted'
                                    ? getCommanSizedBox()
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Self Hosted'
                                    ? InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: primary,
                                            borderRadius: BorderRadius.circular(
                                                circularBorderRadius5),
                                          ),
                                          width: 90,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              getTranslated(context, "Upload")!,
                                              style: const TextStyle(
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) => const Media(
                                                from: "archive,document",
                                                pos: 0,
                                                type: "add",
                                              ),
                                            ),
                                          ).then((value) => setState(() {}));
                                        },
                                      )
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                            'Self Hosted' &&
                                        addProvider!.digitalProductName != ''
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.file_open_rounded),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              addProvider!.digitalProductName,
                                              maxLines: 10,
                                              softWrap: true,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Add Link'
                                    ? getCommanSizedBox()
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Add Link'
                                    ? getPrimaryCommanText(
                                        'Digital Product Link', false)
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Add Link'
                                    ? getCommanSizedBox()
                                    : Container(),
                                addProvider!.selectedDigitalProductTypeOfDownloadLink ==
                                        'Add Link'
                                    ? getCommanInputTextField(
                                        'Paste digital product link or URL here',
                                        19,
                                        0.06,
                                        1,
                                        2,
                                        context,
                                      )
                                    : Container(),
                              ],
                            )
                          : Container(),
                      getCommanSizedBox(),
                      getCommonButtonAdd(
                        getTranslated(context, "Save Settings")!,
                        8,
                        setState,
                        context,
                      )
                    ],
                  )
                : Container(),
          ],
        )
      : Container();
}

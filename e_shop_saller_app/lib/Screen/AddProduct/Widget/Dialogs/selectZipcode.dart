//------------------------------------------------------------------------------
//============================ Selected Pin codes Type =========================
import 'package:flutter/material.dart';
import 'package:sellermultivendor/Screen/AddProduct/Add_Product.dart';
import '../../../../Helper/Color.dart';
import '../../../../Helper/Constant.dart';
import '../../../../Widget/routes.dart';
import '../../../../Widget/validation.dart';

zipcodeDialog(BuildContext context, Function setState) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(circularBorderRadius25),
            topRight: Radius.circular(circularBorderRadius25),
          ),
        ),
        child: StatefulBuilder(
          builder: (BuildContext context, setStater) {
            addProvider!.taxesState = setStater;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                  child: Text(
                    getTranslated(context, "Select Zipcodes")!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: primary),
                  ),
                ),
                const Divider(color: lightBlack),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: () {
                        bool flag = false;
                        return addProvider!.zipSearchList
                            .asMap()
                            .map(
                              (index, element) => MapEntry(
                                index,
                                InkWell(
                                  onTap: () {
                                    if (!flag) {
                                      flag = true;
                                    }
                                    if (addProvider!.deliverableZipcodes ==
                                        null) {
                                      addProvider!.deliverableZipcodes =
                                          addProvider!
                                              .zipSearchList[index].zipcode;
                                    } else if (addProvider!.deliverableZipcodes!
                                        .contains(
                                            '${addProvider!.zipSearchList[index].zipcode!},')) {
                                      var a =
                                          '${addProvider!.zipSearchList[index].zipcode!},';
                                      var b = addProvider!.deliverableZipcodes!
                                          .replaceAll(a, '');

                                      addProvider!.deliverableZipcodes = b;
                                    } else if (addProvider!.deliverableZipcodes!
                                        .contains(addProvider!
                                            .zipSearchList[index].zipcode!)) {
                                      var a = addProvider!
                                          .zipSearchList[index].zipcode!;
                                      var b = addProvider!.deliverableZipcodes!
                                          .replaceAll(a, "");
                                      addProvider!.deliverableZipcodes = b;
                                    } else if (addProvider!.deliverableZipcodes!
                                        .endsWith(',')) {
                                      addProvider!.deliverableZipcodes =
                                          "${addProvider!.deliverableZipcodes!}${addProvider!.zipSearchList[index].zipcode!}";
                                    } else {
                                      addProvider!.deliverableZipcodes =
                                          "${addProvider!.deliverableZipcodes!},${addProvider!.zipSearchList[index].zipcode!}";
                                    }
                                    setState();
                                    setStater(() => {});
                                    setState();
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: addProvider!
                                                        .deliverableZipcodes !=
                                                    null &&
                                                addProvider!
                                                    .deliverableZipcodes!
                                                    .contains(addProvider!
                                                        .zipSearchList[index]
                                                        .zipcode!)
                                            ? Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                  color: grey2,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: 16,
                                                    width: 16,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: primary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                  color: grey2,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: 16,
                                                    width: 16,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            addProvider!
                                                .zipSearchList[index].zipcode!,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList();
                      }(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        getTranslated(context, "CANCEL")!,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        addProvider!.deliverableZipcodes = null;
                        setState(() {});
                        Routes.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text(
                        getTranslated(context, "Ok")!,
                      ),
                      onPressed: () {
                        Routes.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

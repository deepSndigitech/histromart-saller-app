import 'package:flutter/material.dart';
import '../../../../Helper/Color.dart';
import '../../../../Helper/Constant.dart';
import '../../../../Widget/validation.dart';
import '../../EditProduct.dart';

zipcodeDialog(
  BuildContext context,
  Function update,
) async {
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
            editProvider!.taxesState = setStater;
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
                        return editProvider!.zipSearchList
                            .asMap()
                            .map(
                              (index, element) => MapEntry(
                                index,
                                InkWell(
                                  onTap: () {
                                    if (!flag) {
                                      flag = true;
                                    }
                                    if (editProvider!.deliverableZipcodes ==
                                            null ||
                                        editProvider!.deliverableZipcodes ==
                                            '') {
                                      editProvider!.deliverableZipcodes =
                                          editProvider!
                                              .zipSearchList[index].zipcode;
                                    } else if (editProvider!
                                        .deliverableZipcodes!
                                        .contains('${editProvider!
                                                .zipSearchList[index].zipcode!},')) {
                                      var a = '${editProvider!
                                              .zipSearchList[index].zipcode!},';
                                      var b = editProvider!.deliverableZipcodes!
                                          .replaceAll(a, '');

                                      editProvider!.deliverableZipcodes = b;
                                    } else if (editProvider!
                                        .deliverableZipcodes!
                                        .contains(editProvider!
                                            .zipSearchList[index].zipcode!)) {
                                      var a = editProvider!
                                          .zipSearchList[index].zipcode!;
                                      var b = editProvider!.deliverableZipcodes!
                                          .replaceAll(a, "");
                                      editProvider!.deliverableZipcodes = b;
                                    } else if (editProvider!
                                        .deliverableZipcodes!
                                        .endsWith(',')) {
                                      editProvider!.deliverableZipcodes =
                                          "${editProvider!.deliverableZipcodes!}${editProvider!.zipSearchList[index].zipcode!}";
                                    } else {
                                      editProvider!.deliverableZipcodes =
                                          "${editProvider!.deliverableZipcodes!},${editProvider!.zipSearchList[index].zipcode!}";
                                    }
                                    update();

                                    setStater(() => {});
                                    update();
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: editProvider!
                                                        .deliverableZipcodes !=
                                                    null &&
                                                editProvider!
                                                    .deliverableZipcodes!
                                                    .contains(editProvider!
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
                                            editProvider!
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
                        editProvider!.deliverableZipcodes = null;
                        update();
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text(
                        getTranslated(context, "Ok")!,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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

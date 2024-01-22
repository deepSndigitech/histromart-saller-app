import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sellermultivendor/Helper/Color.dart';
import 'package:sellermultivendor/Widget/validation.dart';
import '../Helper/Constant.dart';
import '../Provider/settingProvider.dart';
import 'appBar.dart';
import 'simmerEffect.dart';

class ProductDescription extends StatefulWidget {
  String? description;
  String title;

  ProductDescription(this.description, this.title, {Key? key})
      : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String result = '';
  bool isLoading = true;
  final HtmlEditorController controller = HtmlEditorController();

  @override
  void initState() {
    setValue();

    super.initState();
    setValueNow();
  }

  setValueNow() async {
    Future.delayed(
      Duration.zero,
      () {
        // controller.setText(widget.description!);
      },
    );
  }

  setValue() async {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(
          () {
            isLoading = false;
          },
        );
      },
    );

    Future.delayed(
      const Duration(seconds: 6),
      () {
        setState(
          () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.setText(widget.description!);
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus(); // for close keybord
        }
      },
      child: Scaffold(
        appBar: getAppBar(
          title,
          context,
        ),
        backgroundColor: white,
        resizeToAvoidBottomInset: true,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: white,
              onPressed: () {
                controller.clear();
              },
              child: Text(
                getTranslated(context, "Clear")!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: textFontSize14,
                  color: primary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              backgroundColor: white,
              onPressed: () {
                Navigator.of(context).pop(result);
              },
              child: Text(
                getTranslated(context, "SAVE_LBL")!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: textFontSize14,
                  color: primary,
                ),
              ),
            ),
          ],
        ),
        body: isLoading
            ? const ShimmerEffect()
            : HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  autoAdjustHeight: true,
                  hint: getTranslated(
                      context, 'Please Enter Product Description here...!')!,
                  shouldEnsureVisible: true,
                  adjustHeightForKeyboard: true,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.aboveEditor,
                  toolbarType: ToolbarType.nativeGrid,
                  //by default
                  gridViewHorizontalSpacing: 0,
                  gridViewVerticalSpacing: 0,
                  dropdownBackgroundColor: lightWhite,
                  toolbarItemHeight: 40,
                  buttonColor: fontColor,
                  buttonFocusColor: primary,
                  buttonBorderColor: Colors.red,
                  buttonFillColor: secondary,
                  dropdownIconColor: primary,
                  dropdownIconSize: 26,
                  textStyle: const TextStyle(
                    fontSize: textFontSize16,
                    color: pink,
                  ),
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
                    return true;
                  },
                  mediaUploadInterceptor:
                      (PlatformFile file, InsertFileType type) async {
                    return true;
                  },
                ),
                otherOptions: OtherOptions(
                  height: height * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(circularBorderRadius25),
                    color: lightWhite,
                  ),
                ),
                callbacks: Callbacks(
                  onBeforeCommand: (String? currentHtml) {},
                  onChangeContent: (String? changed) {},
                  onChangeCodeview: (String? changed) {
                    result = changed!;
                  },
                  onNavigationRequestMobile: (String url) {
                    return NavigationActionPolicy.ALLOW;
                  },
                ),
              ),
      ),
    );
  }
}

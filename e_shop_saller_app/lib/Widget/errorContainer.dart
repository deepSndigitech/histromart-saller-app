import 'package:flutter/cupertino.dart';
import 'package:sellermultivendor/Helper/Constant.dart';

class ErrorContainer extends StatelessWidget {
  final String errorMessage;
  final Function onTapRetry;
  const ErrorContainer(
      {Key? key, required this.onTapRetry, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(errorMessage),
          const SizedBox(
            height: 10,
          ),
          CupertinoButton(
              child: Text(tryAgainLabelKey),
              onPressed: () {
                onTapRetry.call();
              })
        ],
      ),
    );
  }
}

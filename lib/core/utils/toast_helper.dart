import 'package:fluttertoast/fluttertoast.dart';
import 'package:seclob/core/constants/app_color.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    msg: message,
    fontSize: 15,
    backgroundColor: AppColor.lightBlackColor,
  );
}


import 'package:fluttertoast/fluttertoast.dart';

import 'app_size.dart';

class DialogUtil {
  static buildToast(String str) {
    Fluttertoast.showToast(
        fontSize: AppSize.sp(13),
        gravity: ToastGravity.CENTER,
        msg: str);
  }


}
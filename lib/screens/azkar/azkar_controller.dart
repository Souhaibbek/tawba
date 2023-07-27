import 'dart:developer';

import 'package:get/get.dart';
import 'package:tawba/models/zekrModel.dart';
import 'package:tawba/utils/azkar_data.dart';

class AzkarController extends GetxController {
  List<ZekrModel> zekrSabah = [];
  List<ZekrModel> getZekrSabah() {
    for (var item in azkarSabah) {
      zekrSabah.add(ZekrModel.fromJson(item));
    }
    update();
    log(zekrSabah[1].ref);
    return zekrSabah;
  }
}

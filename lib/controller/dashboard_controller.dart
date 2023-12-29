import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr_bala/model/page4_model.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _parseAssetData();
  }

  RxInt selectedTab = 0.obs;
  RxInt pageIndex = 2.obs;
  BuildContext mcontext;
  DashboardController({required this.mcontext});
  Page4Model model = Page4Model(page4: []);

  updateTapIndex(valueIndex) {
    selectedTab.value = valueIndex;
    pageIndex.value = 2;
    update();
  }

  updatePageIndex(valueIndex) {
    pageIndex.value = valueIndex;
    update();
  }

  void _parseAssetData() async {
    String data =
        await DefaultAssetBundle.of(mcontext).loadString("assets/page4.json");
    model = Page4Model.fromJson(jsonDecode(data));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr_bala/controller/dashboard_controller.dart';
import 'package:hogr_bala/page3_widget.dart';
import 'package:hogr_bala/page4_widget.dart';
import 'package:hogr_bala/page5_widget.dart';
import 'package:hogr_bala/page6_widget.dart';

class Page2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(mcontext: context),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.867),
            title: Text(
              'PAGE ${controller.pageIndex.value}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            leading: Visibility(
              visible: controller.pageIndex.value != 2,
              child: IconButton(
                  onPressed: () {
                    if (controller.pageIndex.value == 3) {
                      controller.updatePageIndex(2);
                    } else if (controller.pageIndex.value == 4) {
                      controller.updatePageIndex(3);
                    } else if (controller.pageIndex.value == 5) {
                      controller.selectedTab.value == 1
                          ? controller.updateTapIndex(1)
                          : controller.updateTapIndex(2);
                    } else if (controller.pageIndex.value == 6) {
                      controller.updateTapIndex(2);
                    }
                  },
                  icon: Icon(
                    controller.pageIndex.value == 5
                        ? Icons.clear
                        : Icons.arrow_back,
                    size: 35,
                  )),
            ),
            automaticallyImplyLeading: false,
          ),
          body: controller.pageIndex.value == 2
              ? buildPage2Widget(controller)
              : controller.pageIndex.value == 3
                  ? Page3Widget()
                  : controller.pageIndex.value == 4
                      ? Page4Widget(
                          listItems: controller.model.page4,
                        )
                      : controller.pageIndex.value == 5
                          ? Center(child: const Page5Widget())
                          : controller.pageIndex.value == 6
                              ? Center(child: Page6Widget())
                              : Container(),
          bottomNavigationBar: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => controller.updateTapIndex(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      color: controller.selectedTab.value == 0
                          ? Colors.black
                          : Colors.grey,
                      child: const Center(
                        child: Text(
                          'Tab 1',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    width: 2,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => controller.updateTapIndex(1),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      color: controller.selectedTab.value == 1
                          ? Colors.black
                          : Colors.grey,
                      child: const Center(
                        child: Text(
                          'Tab 2',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 2,
                    width: 2,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () => controller.updateTapIndex(2),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      color: controller.selectedTab.value == 2
                          ? Colors.black
                          : Colors.grey,
                      child: const Center(
                        child: Text(
                          'Tab 3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  buildPage2Widget(DashboardController controller) {
    return controller.selectedTab.value == 0
        ? buildTab1Widget(controller)
        : controller.selectedTab.value == 1
            ? buildTab2Widget(controller)
            : buildTab3Widget(controller);
  }

  buildTab1Widget(DashboardController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.updatePageIndex(3);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // button's shape
                ),
              ),
              child: const Text('Page 3'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                showCancelDialogbox(controller);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // button's shape
                ),
              ),
              child: const Text('Popup 1'),
            ),
          ),
        ],
      ),
    );
  }

  buildTab2Widget(DashboardController controller) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            controller.updatePageIndex(5);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // button's shape
            ),
          ),
          child: const Text('Page 5'),
        ),
      ),
    );
  }

  buildTab3Widget(DashboardController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.updatePageIndex(5);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // button's shape
                ),
              ),
              child: const Text('Page 5'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                controller.updatePageIndex(6);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // button's shape
                ),
              ),
              child: const Text('page 6'),
            ),
          ),
        ],
      ),
    );
  }

  void showCancelDialogbox(DashboardController controller) {
    Get.dialog(
      barrierDismissible: false,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Material(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, top: 5),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.cancel_sharp,
                              size: 35,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "Popup 1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800),
                          ),

                          const SizedBox(height: 20),
                          //Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 45),
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    controller.updatePageIndex(3);
                                  },
                                  child: const Text(
                                    'Page 3',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 45),
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    controller.updateTapIndex(1);
                                  },
                                  child: const Text(
                                    'Tab 2',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:new_spinner/app/core/constants/app_assets.dart';
import 'package:new_spinner/app/core/constants/app_colors.dart';
import 'package:new_spinner/features/spinner/controller/spinner2_contoller.dart';
import 'package:new_spinner/features/widgets/start_button.dart';

class Spinner2Page extends GetView<Spinner2Controller> {
  const Spinner2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(187, 1, 9, 1), Color.fromRGBO(66, 0, 3, 1)],
          ),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 130),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Images.machineBorder)),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 28,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightRed,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: SlotMachine(
                      height: 58,
                      reelItemExtent: 80,
                      reelSpacing: 3,
                      reelWidth: 75,
                      rollItems: [
                        RollItem(
                          index: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(Images.item4),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        RollItem(
                          index: 1,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(Images.item7),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        RollItem(
                          index: 2,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(Images.item8),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                      onCreated: (c) => controller.machineController = c,
                      onFinished: controller.onFinished,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isStarted.value
                  ? const SizedBox(height: 50)
                  : StartButtton(ontap: controller.start),
            ),
          ],
        ),
      ),
    );
  }
}

//  //  ListView.builder(
//           //   itemCount: controller.items.length,
//           //   itemBuilder: (context, i) {
//           //     String items = controller.items[i];
//           //     return
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromRGBO(187, 1, 9, 1),
//                   Color.fromRGBO(66, 0, 3, 1),
//                 ],
//               ),
//             ),
//             child: Column(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 50,
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Icon(
//                         Icons.arrow_back,
//                         color: Color.fromARGB(255, 237, 236, 236),
//                         size: 30,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 130),
//                 Container(
//                   height: 220,
//                   width: 340,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image.asset(
//                         Images.machineBorder,
//                         height: 220,
//                         width: 340,
//                         fit: BoxFit.fill,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 196, 1, 1),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(
//                             horizontal: 2,
//                             vertical: 2,
//                           ),
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [Color(0xffFFD700), Color(0xffFFA500)],
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: const Color(0xff8B0000),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 7,
//                               vertical: 9,
//                             ),\
//                             // ⬜ WHITE SLOT WINDOW
//                             child: Container(
//                               height: 90,
//                               decoration: BoxDecoration(
//                                 border: Border.all(),
//                                 color: Colors.white,
//                               ),
//                               child: SlotMachine(
//                                 height: 60,
//                                 onCreated: (c) =>
//                                     controller.machineController = c,
//                                 onFinished: controller.onFinished,
//                                 rollItems: [
//                                   RollItem(
//                                     index: 0,
//                                     child: Center(
//                                       child: Image.asset(
//                                         Images.item1,
//                                         height: 40,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   RollItem(
//                                     index: 1,
//                                     child: Center(
//                                       child: Image.asset(
//                                         Images.item2,
//                                         height: 40,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                   RollItem(
//                                     index: 2,
//                                     child: Center(
//                                       child: Image.asset(
//                                         Images.item3,
//                                         height: 40,
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 StartButtton(
//                   ontap: () async {
//                     controller.onStart();
//                   },
//                 ),
//               ],
//             ),
//           ),
//       //   },
//       // ),

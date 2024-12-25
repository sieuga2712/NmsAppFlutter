// import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TrangchuView extends GetView<TrangchuController> {
//   @override
//   final TrangchuController controller = Get.find();

//   TrangchuView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFFF5F5F5),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12.0),
//             border: Border.all(color: Colors.grey),
//           ),
//           child: const Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
//             children: [
//               Text(
//                 'Trang chủ',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';

class TrangchuView extends StatefulWidget {
  const TrangchuView({super.key});
  @override
  TrangchuViewState createState() => TrangchuViewState();
}

class TrangchuViewState extends State<TrangchuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 26, left: 7, right: 7),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    width: 162,
                                    height: 70,
                                    child: Image.network(
                                      "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/04b7bdc7-ce39-4d91-9187-1e50b12675c9",
                                      fit: BoxFit.fill,
                                    )),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(right: 13),
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                      "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/43ec28e4-7e4c-45e1-a566-88b2f5b8ca63",
                                      fit: BoxFit.fill,
                                    )),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 16, left: 11, right: 11),
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: LinearGradient(
                                            begin: Alignment(-1, 1),
                                            end: Alignment(3, 1),
                                            colors: [
                                              Color(0xFF4328EA),
                                              Color(0xFFF5F3FF),
                                            ],
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 14,
                                            bottom: 14,
                                            left: 8,
                                            right: 8),
                                        width: 165,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 25),
                                                child: Text(
                                                  "124",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 24),
                                                child: Text(
                                                  "Chương trình soạn thảo",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 13.2,
                                                  ),
                                                ),
                                              ),
                                              IntrinsicHeight(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 3),
                                                  width: double.infinity,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 4),
                                                          child: Text(
                                                            "Chi tiết",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF000000),
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 13,
                                                            height: 13,
                                                            child:
                                                                Image.network(
                                                              "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/31622acd-1e86-4ee7-8d33-58de2a9d3512",
                                                              fit: BoxFit.fill,
                                                            )),
                                                      ]),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: LinearGradient(
                                            begin: Alignment(-1, 1),
                                            end: Alignment(3, 1),
                                            colors: [
                                              Color(0xFFEA3F28),
                                              Color(0xFFFDEAE7),
                                            ],
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 14,
                                            bottom: 14,
                                            left: 8,
                                            right: 8),
                                        width: 165,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 26),
                                                child: Text(
                                                  "0",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 23),
                                                child: Text(
                                                  "Chương trình đang SX",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 13.2,
                                                  ),
                                                ),
                                              ),
                                              IntrinsicHeight(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 3),
                                                  width: double.infinity,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 4),
                                                          child: Text(
                                                            "Chi tiết",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF000000),
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 13,
                                                            height: 13,
                                                            child:
                                                                Image.network(
                                                              "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/8dea6734-4822-463d-a159-7ffa45bc083a",
                                                              fit: BoxFit.fill,
                                                            )),
                                                      ]),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 11),
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: LinearGradient(
                                            begin: Alignment(-1, 1),
                                            end: Alignment(3, 1),
                                            colors: [
                                              Color(0xFF0084FF),
                                              Color(0xFFE3F1FF),
                                            ],
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 14,
                                            bottom: 14,
                                            left: 8,
                                            right: 8),
                                        width: 165,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 26),
                                                child: Text(
                                                  "2",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 23),
                                                child: Text(
                                                  "Chờ phê duyệt KB",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 13.2,
                                                  ),
                                                ),
                                              ),
                                              IntrinsicHeight(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 3),
                                                  width: double.infinity,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 4),
                                                          child: Text(
                                                            "Chi tiết",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF000000),
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 13,
                                                            height: 13,
                                                            child:
                                                                Image.network(
                                                              "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/92c73bbb-07a5-4099-bf0e-ae58d7cc3bb5",
                                                              fit: BoxFit.fill,
                                                            )),
                                                      ]),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: LinearGradient(
                                            begin: Alignment(-1, 1),
                                            end: Alignment(3, 1),
                                            colors: [
                                              Color(0xFFEA2891),
                                              Color(0xFFFDE7F3),
                                            ],
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 14,
                                            bottom: 14,
                                            left: 8,
                                            right: 8),
                                        width: 165,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 25),
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 24),
                                                child: Text(
                                                  "Kịch bản bị trả",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 13.2,
                                                  ),
                                                ),
                                              ),
                                              IntrinsicHeight(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 3),
                                                  width: double.infinity,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 4),
                                                          child: Text(
                                                            "Chi tiết",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF000000),
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 13,
                                                            height: 13,
                                                            child:
                                                                Image.network(
                                                              "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/61b37ade-1dc0-47e0-8c89-4957ebf6dd9a",
                                                              fit: BoxFit.fill,
                                                            )),
                                                      ]),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';

// // ignore: must_be_immutable
// class FavoraitContact extends StatefulWidget {
//   const FavoraitContact({Key? key}) : super(key: key);

//   @override
//   State<FavoraitContact> createState() => _FavoraitContactState();
// }

// class _FavoraitContactState extends State<FavoraitContact> {
//   @override
//   void initState() {
//   getPeopleILiked();
//     super.initState();
//   }
//   @override
//     void dispose() {
//       super.dispose();
//     }
//   getPeopleILiked() async {
//     EasyLoading.show(status: "... جاري التحميل");
//       /// to get all user info
//     await  _userConreoler.updatePeopleILiked(_authConreoler.userId.value);
//     EasyLoading.dismiss();
//     setState(() {});
//   }
  
//   addRoom(String senderId, String myUserId, MyPerson person) async {
//     await _chatConreoler.addRoom(ChatRoom(
//       users: [senderId, myUserId],
//     ));
//     await _subscriptionController
//         .increaseCurrentSupNumber(_authConreoler.userId.value);

//     Get.to(ChatScreen(
//       person: person,
//     ));
//   }

//   goToChatRoom(String senderId, String myUserId, MyPerson person) async {
//     await _chatConreoler.getRoomIdByUser(senderId, myUserId);
//     await _subscriptionController
//         .getMySubscription(_authConreoler.userId.value);
//     if (_chatConreoler.currentRoom.value != "" &&
//         _chatConreoler.currentRoom.value != null) {
//       Get.to(ChatScreen(person: person));
//     } else {
//       if (_userConreoler.myUser.value.gendervalue == 'امراة' &&
//           _subscriptionController.freeSubScription.value == true) {
//         addRoom(senderId, myUserId, person);
//       } else {
//         _subscriptionController.mySubscription.value.currentSubNumber! <
//                 _subscriptionController.mySubscription.value.maxSubNumber!
//             ? addRoom(senderId, myUserId, person)
//             : Get.snackbar("ناسف ", "الرجاء تجديد الاشتراك");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx( ()=>_userConreoler.myLikedUsers.value.length > 0
//         ? Column(
//             children: [
//               SizedBox(
//                 height: 115,
//                 child: ListView.builder(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: _userConreoler.myLikedUsers.value.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: GestureDetector(
//                         onTap: () async {
//                           await goToChatRoom(_authConreoler.userId.value,
//                               _userConreoler.myLikedUsers.value[index].id!, _userConreoler.myLikedUsers.value[index]);
//                         },
//                         child: Column(
//                           children: [
//                             _userConreoler.myLikedUsers.value[index].imagePath!.length > 3
//                                 ? CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundImage: NetworkImage(
//                                         _userConreoler.myLikedUsers.value[index].imagePath!),
//                                   )
//                                 : const CircleAvatar(
//                                     radius: 30.0,
//                                     backgroundImage: AssetImage(
//                                         'assets/images/belhahaIcon.png'),
//                                   ),
//                             const SizedBox(
//                               height: 6.0,
//                             ),
//                             Expanded(
//                               child:
//                                   Text(_userConreoler.myLikedUsers.value[index].name!.split(" ")[0],
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 14.0,
//                                         fontWeight: FontWeight.w600,
//                                       )),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           )
//         : Container(
//             child: const Text("لم يتم الإعجاب بأحد بعد"),
//           ));
//   }
// }

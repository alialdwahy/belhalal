// import 'package:cached_network_image/cached_network_image.dart';
import 'package:belhalal_update/screen/user_info.dart';
import 'package:belhalal_update/value/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'chat/models/user_model.dart';

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const CarouselDemoHome(),
            '/fullscreen': (ctx) =>  FullscreenSliderDemo(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  const CarouselDemoHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FullscreenSliderDemo(),
    );
  }
}

// ignore: must_be_immutable
class FullscreenSliderDemo extends StatelessWidget {
   FullscreenSliderDemo({Key? key}) : super(key: key);
  bool? _visible = true;
  // getUsers() async {
  //  // EasyLoading.show(status: "جاري التحميل ..");
  //   //await _appController.getUsers();
  //  // EasyLoading.dismiss();
  // }
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
    //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
    //ToDO: Update value using controller    
      _visible = false;
    });
  }
  final List<User>? userList = [
    User(
        name: 'mmm',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'sdsfsf',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'ddddddd',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'fffffff',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'wwwww',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'rrrrrr',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'tttttt',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
    User(
        name: 'yyyyyy',
        age: 25,
        imageUrl: 'assets/images/greg.jpg',
        country: "السعودية",
        gendervalue: "رجل",
        job: "sdfsdfsf",
        annualIncomeValue: "sdfsdfsf",
        long: "120",
        skinColor: "white",
        weight: "90"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height;
            return CarouselSlider(
              // items: userList,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                reverse: true,
                height: height,
                initialPage: 0,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                //TODO onChanged change Slider index Using Controller
                //   onPageChanged: (v, s) {
                //
                //    }
              ),
              items: userList
                  ?.map((item) => GestureDetector(
                        onTap: () {
                          Get.to(UserInfo(
                            myUser: item,
                          ));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              decoration:const BoxDecoration(
                                borderRadius:  BorderRadius.only(),
                                color: Constant.kPrimaryColor,
                              ),
                              child: item.imageUrl!.length > 3
                                  ? CachedNetworkImage(
                                      imageUrl: item.imageUrl!,
                                      color: Colors.white,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const Center(
                                              child: CircularProgressIndicator(
                                        color: Colors.blue,
                                        backgroundColor: Colors.white,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    )
                                  : Image.asset(
                                      "assets/images/person.png",
                                      fit: BoxFit.contain,
                                    ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 60.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 50.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(' ${item.name}  ',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                const Text('   الاسم',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text('  ${item.age} ',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    )),
                                                const Text('   العمر',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: const [
                                                Text(
                                                    '        لمعرفة المزيد اضغط على  الصورة',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                    )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                color: Colors.transparent,
                child: Visibility(
                  visible: _visible!,
                  child: const Text(
                    'اسحب الشاشة لليمين لرؤية التالي واليسار لرؤية السابق',
                    style: TextStyle(fontSize: 12),
                  ),
                )),
          ),
        ),
      ]),
    );
  }
}

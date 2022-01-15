import 'package:belhalal_update/screen/chat/Screens/chat_home_screen.dart';
import 'package:belhalal_update/value/const.dart';
import 'package:flutter/material.dart';
import '../new_image_slider.dart';
import '../profile_screen.dart';
import '../search.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  int? selectedIndex;
  final List<Widget> _widgetOptions = <Widget>[
    const CarouselDemo(),
    const SearchScreen(),
    const ChatHomeScreen(),
     Profile(),
  ];

  Widget getSelectedPage() {
    switch (selectedIndex) {
      case 0:
        {
          return _widgetOptions[0];
        }
      case 1:
        {
          return _widgetOptions[1];
        }
      case 2:
        {
          return _widgetOptions[2];
        }
      case 3:
        {
          return _widgetOptions[3];
        }
      default:
        {
          return _widgetOptions[0];
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getSelectedPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: selectedIndex!,
        selectedItemColor: Constant.kPrimaryColor,
        unselectedItemColor: Colors.blueGrey[400],
        //TODO update selectedIndex  value 
        onTap: (index) {
          selectedIndex = index;
        },
      ),
    );
  }
}

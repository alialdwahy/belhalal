import 'package:belhalal_update/screen/widgets/block_list_tab_bar.dart';
import 'package:belhalal_update/screen/widgets/like_list_tab_bar.dart';
import 'package:belhalal_update/screen/widgets/search_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.red[400],//kPrimaryColor ,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          automaticallyImplyLeading :false,
          centerTitle:true,
          backgroundColor: Colors.red[400],//kPrimaryColor ,
          title:Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 GestureDetector(
                  onTap: ()=>Get.to(()=>const LikeListTabBar(),),
                  child: const SizedBox(
                    width:90,
                    height: 30,
                    child:Text('أعجبني',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:14,
                    ),),
                  ),
                ),
                const SizedBox(width: 15,),
                Container(
                  width: 2,
                  height: 45,
                  decoration: const BoxDecoration(
                   color:Colors.white,
                   border: Border(
                    right: BorderSide(color: Colors.white),
                    left: BorderSide(color: Colors.white),
                  ),
                ),
                ),
                const SizedBox(width: 15,),
                  GestureDetector(
                  onTap: ()=>Get.to(()=>const BlockListTabBar()),
                  child: const SizedBox(
                    width:90,
                    height: 30,
                    child:Text('محظورين',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:14,
                    ),),
                  ),
                ),         
              ],
            ),
          ),
        ),
        body: const 
          SearchForm(),
      ),
    );
  }
}

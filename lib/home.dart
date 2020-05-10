import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/callScreen.dart';
import 'package:whatsapp_clone/screens/chatScreen.dart';
import 'package:whatsapp_clone/screens/statusScreen.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>HomeState();

}

class HomeState extends State with SingleTickerProviderStateMixin{
  TabController _tabController ; // alt tire private özelliği kazandırır
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this , initialIndex: 1 ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("WhatsApp"),
          bottom: TabBar(
            controller : _tabController ,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.camera_alt),),
              Tab(text: "Sohbetler",),
              Tab(text: "Durum",),
              Tab(text: "Aramalar",)
            ],
          ),
          actions: <Widget>[
            Icon(Icons.search),
            Icon(Icons.more_vert)
          ],
              ),
              body: TabBarView(
                controller : _tabController ,
                children: <Widget>[
                 Text("Kamera"),
                  ChatScreen(),
                   StatusScreen(),
                    CallScreen(),
                ],
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(Icons.message , color:Colors.white),
                  onPressed: ()=>print("Sohbet ekranı"),
                ),
              
    );
  }

}
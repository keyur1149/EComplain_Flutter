import 'package:ecomplain_demo/Mydata.dart';
import 'package:ecomplain_demo/displaycomment.dart';
import 'package:ecomplain_demo/main.dart';
import 'package:ecomplain_demo/showcomplain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import './displaydata.dart';
import './Addcomplain.dart';
import 'dart:core';
import 'package:ecomplain_demo/Addcomplain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'complaintype.dart';

class ProfileScreen extends StatefulWidget {
  // var temp;
  const ProfileScreen({Key? key}) : super(key: key);
  // ProfileScreen(this.temp);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List _Complains=[];
  var _firestoreInstance=FirebaseFirestore.instance;
int _selectedIndex = 0;
  static final _pages = <Widget>[
    Showdata(),//this is a stateful widget on a separate file
    TypeScreen(),//this is a stateful widget on a separate file
    Mycomplain(),//this is a stateful widget on a separate file

  ];
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final CollectionReference complain_yes=FirebaseFirestore.instance.collection('Complain');
 
  fetchcomplains() async{
    QuerySnapshot qn=await _firestoreInstance.collection("Complain").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++){
        _Complains.add({
          "complain":qn.docs[i]["complain"],
          "complain_from":qn.docs[i]["complain_from"],
          "complain_to":qn.docs[i]["complain_to"],
          "type":qn.docs[i]["type"],
        });
      }
    });
    // print(_Complains[0]["complain"]);
    return qn.docs;
  }
  fetchcomplains_my() async{
    QuerySnapshot qn=await _firestoreInstance.collection("Complain").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++){
        _Complains.add({
          "complain":qn.docs[i]["complain"],
          "complain_from":qn.docs[i]["complain_from"],
          "complain_to":qn.docs[i]["complain_to"],
          "type":qn.docs[i]["type"],
        });
      }
    });
    // print(_Complains[0]["complain"]);
    return qn.docs;
  }
  void initState() {
    //When this widget object is created, before starting perform below tasks
    fetchcomplains();
    super.initState();

  }
  /*
   late Stream complainStream;
  // Query dbRef = FirebaseFirestore. instance. ref(). child('Complain');
  getComplain() {
    return  FirebaseFirestore.instance.collection("Complain").snapshots();
  }

  @override
  void initState(){
    complainStream=getComplain().then((val){
      complainStream = val;
      setState((){});
    });
    super.initState();

  }
  */

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color mainColor = Color(0xFF177767);
  var containerRadius = Radius.circular(30.0);




 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Complaint App"),
        backgroundColor: mainColor,
        actions: [

          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      // body:new Column(
      //   children: [
      //
      //     //First let's create the Story time line container
      //     // Container(
      //     //   height: 100.0,
      //     //   child: Padding(
      //     //     padding:
      //     //         const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      //     //     child: ListView(
      //     //       scrollDirection: Axis.horizontal,
      //     //     ),
      //     //   ),
      //     // ),
      //
      //     //Now let's create our chat timeline
      //     // Expanded(
      //     //   child: Container(
      //     //     decoration: BoxDecoration(
      //     //       color: Colors.white,
      //     //       // borderRadius: BorderRadius.only(
      //     //       //     topLeft: containerRadius, topRight: containerRadius),
      //     //     ),
      //         // child: Padding(
      //         //   padding:
      //         //       const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      //         //   // child: ListView(
      //         //   //   children: [
      //         //   //
      //         //   //     //Now let's create our chat tile custom widget
      //         //   //     displaydata(imageUrl[0], "To: userName", "msg", "9Am", false),
      //         //   //     displaydata(imageUrl[1], "To: userName", "msg", "8Am", true),
      //         //   //     displaydata(imageUrl[2], "userName", "msg", "6Am", true),
      //         //   //     displaydata(
      //         //   //         imageUrl[3], "userName", "msg", "Yesterday", false),
      //         //   //     displaydata(
      //         //   //         imageUrl[4], "userName", "msg", "Yesterday", false),
      //         //   //     displaydata(imageUrl[5], "userName", "msg", "San 20", true),
      //         //   //     displaydata(imageUrl[6], "userName", "msg", "San20", true),
      //         //   //     displaydata(imageUrl[7], "userName", "msg", "San20", true),
      //         //   //     displaydata(imageUrl[0], "userName", "msg", "9Am", false),
      //         //   //     displaydata(imageUrl[0], "userName", "msg", "9Am", false),
      //         //   //     displaydata(imageUrl[0], "userName", "msg", "9Am", false),
      //         //   //     displaydata(imageUrl[0], "userName", "msg", "9Am", false),
      //         //   //   ],
      //         //   // ),
      //         // ),
      //      // ),
      //     )
      //   ],
      // ),
      body: SafeArea(

        child: _pages.elementAt(_selectedIndex),

    //     child: GridView.builder(
    // scrollDirection: Axis.vertical,
    // itemCount: _Complains.length,
    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    // crossAxisCount: 2, childAspectRatio: 1),
    // itemBuilder: (_, index) {
    //   return GestureDetector(
    //
    //     onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>displaycomplain(_Complains[index]))),
    //     child: Card(
    //       elevation: 3,
    //
    //
    //       child: Column(
    //
    //         children: [
    //           Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI3rm3CkQ5Z89UjTGfiEJLNhOVYZUwzJALN73jPd4WggIkUJs5fvbUG88niP8Ls2hE_Cc&usqp=CAU',width: MediaQuery.of(context).size.width / 5 * 5,),
    //           //Print(_Complains[index]["complain"]);
    //           // Text("${_Complains[index]["complain"]}"),
    //           // Text("${_Complains[index]["complain_from"]}"),
    //           Text("${_Complains[index]["complain_to"]}"),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    // ),

      ),


      /* 

      // new Container(
      // height: 45.0,
      // width: 45.0,
      // child: Center(
      // child:Card(
      // elevation: 5.0,
      // shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(25.0), // half of height and width of Image
      // ),
      // child: IconButton(
      // icon: new Icon(Icons.call,size: 20.0,),
      // color: Color(0xFF162A49),
      // onPressed: () {},
      // ),
      // ),
      // )
      // ),
      // ],
      // ),
      // ),
      // Text('Copyright ©2020, All Rights Reserved.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0, color: Color(0xFF162A49)),),
      // // Text('Powered by Nexsport',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0,color: Color(0xFF162A49)),),
      // ]
      // ),
      // ),
      //

      floatingActionButton: new FloatingActionButton(
          elevation: 10.0,
          child: new Icon(Icons.add_box_rounded ),
          backgroundColor: Color(0xFF162A49),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Addcomplain()));
          }),
      // This trailing comma makes auto-formatting nicer for build methods. // Center
    ); // Scaffold
  }



}

// class Complain {
//   final String complain_to;
//   final String complain_from;
//   final String complain;
//   Complain({
//     required this.complain_from,
//     required this.complain_to,
//     required this.complain
//   });
//   Map<String,dynamic> toJson() => {
//     'complain': complain,
//     'complain_from': complain_from,
//     'complain_to': complain_to,
//   };
//   static Complain fromJson(Map<String,dynamic> json) => Complain(
//       complain: json['complain'],
//       complain_to: json['complain_to'],
//       complain_from: json['complain_from']
//   );
// }


*/

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.list_alt_rounded),
            label: 'Complaintype',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'MyComplain',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 10.0,
          child: new Icon(Icons.add_box_rounded ),
          backgroundColor: Color(0xFF162A49),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Addcomplain()));
          }),
      // This trailing comma makes auto-formatting nicer for build methods. // Center
    ); // Scaffold
  }
}


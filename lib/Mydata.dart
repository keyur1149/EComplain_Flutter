import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'displaycomment.dart';
class Mycomplain extends StatefulWidget {
  // var user;
  const Mycomplain({Key? key}) : super(key: key);

  // Mycomplain(this.user);
  @override
  State<Mycomplain> createState() => _MycomplainState();
}

class _MycomplainState extends State<Mycomplain> {
  List _Complains=[];
  var _firestoreInstance=FirebaseFirestore.instance;
  fetchcomplains() async{
    QuerySnapshot qn=await _firestoreInstance.collection("Complain").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++){
        if(qn.docs[i]["type"]=="Professor" || qn.docs[i]["type"]=="professor") {
          _Complains.add({
            "complain": qn.docs[i]["complain"],
            "complain_from": qn.docs[i]["complain_from"],
            "complain_to": qn.docs[i]["complain_to"],
            "type": qn.docs[i]["type"],
          });
        }
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
  Color mainColor = Color(0xFF177767);
  var containerRadius = Radius.circular(30.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Stack(
        children: [
        Positioned(
        top: 24,
        bottom: 200,
        left: 24,
        right: 24,
        child: Container(
        child: Image.network('https://img.freepik.com/free-vector/404-error-lost-space-concept-illustration_114360-7901.jpg?w=2000'),
    ),
    ),

    ],),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomplain_demo/displaycomment.dart';
import 'package:flutter/material.dart';
class Othercomplain extends StatefulWidget {
  const Othercomplain({Key? key}) : super(key: key);

  @override
  State<Othercomplain> createState() => _OthercomplainState();
}

class _OthercomplainState extends State<Othercomplain> {
  List _Complains=[];
  var _firestoreInstance=FirebaseFirestore.instance;
  fetchcomplains() async{
    QuerySnapshot qn=await _firestoreInstance.collection("Complain").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++){
        if(!(qn.docs[i]["type"]=="Professor" || qn.docs[i]["type"]=="professor") && (!(qn.docs[i]["type"]=="Canteen" || qn.docs[i]["type"]=="canteen")) && (!(qn.docs[i]["type"]=="Adminstration" || qn.docs[i]["type"]=="adminstration")) && (!(qn.docs[i]["type"]=="Sanatory" || qn.docs[i]["type"]=="sanatory"))) {
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
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0.5,
        title: Text("Extra Complaint"),
        backgroundColor: mainColor,
        actions: [

          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
          //   },
          //   icon: Icon(Icons.logout),
          // ),
        ],
      ),
      body: SafeArea(
        // child: _pages.elementAt(_selectedIndex),

        child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _Complains.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (_, index) {
              return GestureDetector(

                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>displaycomplain(_Complains[index]))),
                child: Card(
                  elevation: 3,


                  child: Column(

                    children: [
                      Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI3rm3CkQ5Z89UjTGfiEJLNhOVYZUwzJALN73jPd4WggIkUJs5fvbUG88niP8Ls2hE_Cc&usqp=CAU',width: MediaQuery.of(context).size.width / 5 * 5,),
                      //Print(_Complains[index]["complain"]);
                      // Text("${_Complains[index]["complain"]}"),
                      // Text("${_Complains[index]["complain_from"]}"),
                      Text("${_Complains[index]["complain_to"]}"),
                    ],
                  ),
                ),
              );
            }
        ),

      ),
    );
  }
}

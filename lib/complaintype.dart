import 'package:ecomplain_demo/admindata.dart';
import 'package:ecomplain_demo/canteendata.dart';
import 'package:ecomplain_demo/otherdata.dart';
import 'package:ecomplain_demo/professordata.dart';
import 'package:ecomplain_demo/profile_screen.dart';
import 'package:ecomplain_demo/sanatorydata.dart';
import 'package:flutter/material.dart';
class TypeScreen extends StatefulWidget {
  const TypeScreen({Key? key}) : super(key: key);

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Complian Type",
      home: Scaffold(


        appBar: AppBar(
          elevation: 0.5,
          title: Text("Complain Type"),
          leading: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
          }, icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Color(0xFF177767),
          actions: [


          ],

          //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>displaycomplain(_Complains[index]))),
        ),

        body: Container(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ListTile( title: Text("Professor"),leading: Icon(Icons.account_box), onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Profcomplain()))),
              ListTile( title: Text("Sanatory"), leading: Icon(Icons.sanitizer_outlined),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Sanatorycomplain())) ),
              ListTile( title: Text("Canteen"), leading: Icon(Icons.restaurant), onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Cantcomplain()))),
              ListTile( title: Text("Adminstration"), leading: Icon(Icons.business_center),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Admincomplain()))),
              ListTile( title: Text("Other"), leading: Icon(Icons.note_add),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>Othercomplain()))),
            ],
          ),
        ),

      ),

    );
  }
}

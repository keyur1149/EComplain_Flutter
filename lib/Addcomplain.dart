//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomplain_demo/displaycomment.dart';

import './profile_screen.dart';

import 'package:flutter/material.dart';
class Addcomplain extends StatefulWidget {
  const Addcomplain({Key? key}) : super(key: key);

  @override
  State<Addcomplain> createState() => _AddcomplainState();
}

class _AddcomplainState extends State<Addcomplain> {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Write Your Complain Here';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(


        appBar: AppBar(
          elevation: 0.5,
          title: Text(appTitle),
          leading: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
          }, icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Color(0xFF177767),
          actions: [


          ],

          //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>displaycomplain(_Complains[index]))),
        ),

        body: MyCustomForm(),

      ),

    );
  }

}
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class MyCustomFormState extends State<MyCustomForm> {
  final controller_to=TextEditingController();
  final controller_new=TextEditingController();
  final controller_type=TextEditingController();
  final controller_from=TextEditingController();
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
             // icon: const Icon(Icons.person),

              hintText: 'Complain To',
              labelText: 'Complain To',
              border: OutlineInputBorder(),
            ),
            controller :  controller_to,
          ),
          SizedBox(height: 30),
          TextField(
            decoration: const InputDecoration(
              //icon: const Icon(Icons.phone),
              border: OutlineInputBorder(),
              hintText: 'Enter a Complain',
              labelText: 'Your Complain',
            ),
            controller :  controller_new,
          ),
          SizedBox(height: 30),
         // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          TextField(

            decoration: const InputDecoration(
             // icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your id',
              labelText: 'Complain From',
              border: OutlineInputBorder(),
            ),
            controller :  controller_from,
          ),
          SizedBox(height: 30),
          TextField(
            decoration: const InputDecoration(
              //icon: const Icon(Icons.phone),
              border: OutlineInputBorder(),
              hintText: 'Enter a Complain',
              labelText: 'Complain Type',
            ),
            controller :  controller_type,
          ),
          Container(
              padding: const EdgeInsets.only(left: 130.0, top: 100.0,bottom: 60.0),

              child: new MaterialButton(
                minWidth: 100.0,
                height: 60.0,
               color: Color(0xFF177767),
                child: const Text('Submit',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                ),
                onPressed: (){
                  final String com=controller_new.text;
                  final String com_to=controller_to.text;
                  CreateComplain(complain: com, complain_to: com_to,complain_from:controller_from.text,type: controller_type.text);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));
                },
              )),
        ],
      ),
    );
  }

  Future CreateComplain({required String complain,required String complain_to,required String complain_from,required String type}) async {
    // final doccomplain=
    final docnow=FirebaseFirestore.instance.collection('Complain').doc();
    final newcomplain=Complain(
        complain:complain,
        complain_to:complain_to,
        complain_from: complain_from,
        type: type,
    );
    final json=newcomplain.toJson();

    await docnow.set(json);
  }
}


class Complain {
  final String complain_to;
  final String complain_from;
  final String complain;
  final String type;
  Complain({
    required this.complain_from,
    required this.complain_to,
    required this.complain,
    required this.type
  });
  Map<String,dynamic> toJson() => {
    'complain': complain,
    'complain_from': complain_from,
    'complain_to': complain_to,
    'type':type,
  };
  static Complain fromJson(Map<String,dynamic> json) => Complain(
    complain: json['complain'],
    complain_to: json['complain_to'],
    complain_from: json['complain_from'],
    type:json['type'],
    
);
}




import 'package:ecomplain_demo/displaycomment.dart';
import 'package:flutter/material.dart';

Widget displaydata(
    {required String imgUrl, required String userName, required String msg, required String date, required bool seen}) {
  return InkWell(
    onTap: () {
      // Navigator.popAndPushNamed(context, "/displaycomment");
      // routes: <String, WidgetBuilder>{
      // "/displaycomment": (BuildContext context) => new displaycomplain(),
      // context;
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> displaycomplain()));
     // };
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox.fromSize(
            size: Size(56, 56), // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.green[200], // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {}, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.chat_outlined), // icon
                       // text
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        userName,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(date),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [

                    Expanded(child: Text("Complaint")),
                    // if (seen)
                    //   Icon(
                    //     Icons.check_circle,
                    //     size: 18.0,
                    //     color: Colors.green,
                    //   ),
                    // if (!seen)
                    //   Icon(
                    //     Icons.check_circle_outline,
                    //     color: Colors.grey,
                    //     size: 18.0,
                    //   ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

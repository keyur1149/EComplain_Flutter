import 'package:flutter/material.dart';
class displaycomplain extends StatefulWidget {
 var _Complain;
 displaycomplain(this._Complain);

  @override
  State<displaycomplain> createState() => _displaycomplainState();
}

class _displaycomplainState extends State<displaycomplain> {
  // int likes= widget._Complain["like"];
  int likes=0;
  bool liked=false;
  Widget post() {
    return Card(

      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.account_box_rounded),
              SizedBox(width: 10,),
              Column(children: [
                Text(widget._Complain["complain_to"], style: TextStyle(fontSize: 16, fontWeight:FontWeight.w600),),
                Text(widget._Complain["type"], style: TextStyle(fontSize: 16, fontWeight:FontWeight.w600),),
              ], mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,) // Column
            ],), // Row
            SizedBox(height: 5,),
            // Image.network(imageUrl),
            SizedBox(height: 5,),

              Stack(
                children: [

                  Image.network(
                //"https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
               "https://images.ctfassets.net/co0pvta7hzrh/7aYs7ozTV4i7sP3ydfe3ZJ/a5772c7059ba2af484c31239adbaf178/Customer_Complaint_Form_Thumbnail.png",
                width: MediaQuery.of(context).size.width / 100 * 80,

              ),
                  Positioned(
                    // The Positioned widget is used to position the text inside the Stack widget
                    bottom: 70,
                  

                    child: Container(
                      // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white


                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget._Complain["complain"],
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  )
              ],
              ),

            Padding(child: Row (children: [
              IconButton(padding: EdgeInsets.fromLTRB(0, 0, 5, 0), constraints: BoxConstraints(),
                  onPressed: () {
                    setState((){
                      liked = !liked;
                      if(liked)
                      {
                        likes += 1;
                      }
                      else
                      {
                        likes = 1;
                      }
                    });
                  }, icon: liked == true ? Icon(Icons.favorite, color: Colors.red, ) : Icon(Icons.favorite_border)),
            IconButton(padding: EdgeInsets.fromLTRB(0, 0, 5, 0), constraints: BoxConstraints(),
                onPressed: (){
                }, icon: Icon(Icons.comment_outlined)), // IconButton
            IconButton(padding: EdgeInsets.fromLTRB(0, 0, 5, 0), constraints: BoxConstraints(),
                onPressed: (){
                }, icon: Icon(Icons.bookmark_outline)), // IconButton
          ]), padding: EdgeInsets.all(5),), // Row // Padding
        Padding(child: Row(children: [
            Text(likes.toString()+ "likes"),
            // Text(" likes "),
            ]), padding: EdgeInsets.all(5),),
          ],
        ),
      ),
    ); // Column // Padding // Card
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF177767),
    appBar: AppBar(
    elevation: 0.5,
    title: Text("Complaint App"),
    backgroundColor: Color(0xFF177767),
    actions: [


    ],
    ),
        body: Center(

          child: Column(

            mainAxisAlignment : MainAxisAlignment.center,
            children: [
              post(),
            ],
          ), // Column
        ),// This trailing comma makes auto-formatting nicer
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Id_Card extends StatelessWidget {
  const Id_Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text("My Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.mail)),
          // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios),),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getId(),
            _getImage(),
          ],
        ),
      ),
    );
  }

 Container _getId() {
    return Container(
      height: 250,
      width: 350,
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.cyan,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name : MD.Radhoun Uddin Bhuiyan",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: Colors.pinkAccent.shade700,

          ),),
          Text("User Name : ridwanRahat420",style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.redAccent.shade400,
          ),),
          Text("Address : Rupsha Ishpahani Lane, Khulna ",style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.lightBlue.shade900,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_rounded),
              Text("Email : royalrahat1122@gmail.com",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.indigo.shade400,
              ),),
            ],

          ),

        ],

      ),
    );
 }

  Container _getImage() {
    return Container(
     height: 80,
     width: 80,
     decoration: BoxDecoration(
       color: Colors.cyanAccent,
       borderRadius: BorderRadius.all(Radius.circular(40)),
       border: Border.all(color: Colors.indigo.shade700,width: 2.0),
       image: DecorationImage(image:AssetImage("assets/wallpaperflare.com_wallpaper (4).jpg"),fit: BoxFit.cover ),
     ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class timeLine extends StatefulWidget {
  const timeLine({Key? key}) : super(key: key);

  @override
  _timeLineState createState() => _timeLineState();
}

class _timeLineState extends State<timeLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Time Line",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.mail_sharp))],
      ),
      body: Container(
       alignment: Alignment.center,
        child: Stack(
          
        ),
      ),

    );
  }
}

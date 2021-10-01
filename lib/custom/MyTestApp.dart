



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SacffoldExm
    extends StatelessWidget {
  const SacffoldExm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Project"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed:()=> debugPrint("Its true"), icon: Icon(Icons.access_alarm))
        ],

      ),
      backgroundColor: Colors.red.shade200,
      body:Container(
        alignment: Alignment.center,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

         children: [
           CustomButton(),


         ],
        ),

      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text("Bottom Bar"),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);


      },
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.cyan,
              borderRadius: BorderRadius.circular(50.0),

        ),
        child: Text("Button!"),

      ),



    );
  }
}


// class MyTestApp extends StatelessWidget {
//   const MyTestApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.blueAccent,
//
//       child: Center(
//           child: Text(
//             "Just Testing",
//             textDirection: TextDirection.ltr,
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 24,
//               fontStyle: FontStyle.italic,
//               color: Colors.amber,
//
//
//             ),
//           )),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/screens_gp/auth.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Lottie.network('https://assets7.lottiefiles.com/packages/lf20_pfI6s6.json',height: 500),
                // Text('Take your attendance professionally',
                // style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 20,
                //   color: Colors.lightBlue
                // ),
                //
                // ),
    //             SizedBox(
    //               width: double.infinity,
    //               height: 50,
    //               child: TextButton(onPressed: (){
    //                 Navigator.pushAndRemoveUntil(context,
    //                   MaterialPageRoute(builder: (context) =>  auth()),
    //                         (Route<dynamic>route)=>false
    //                 );
    //               }, child: Text('Get Started',
    //               style:TextStyle(fontSize: 20,
    //                   fontWeight: FontWeight.bold,color: Colors.white),
    //
    //               ),
    //                 style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
    //                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                       RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(18.0),
    //                           side: BorderSide(color: Colors.black),
    //                       ),
    //
    //
    //               ),
    //                 ),
    // ),
    //             ),
              ],


            ),
          ),
        ),
      )
    );
  }
}

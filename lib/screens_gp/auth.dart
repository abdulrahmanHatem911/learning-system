import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:lottie/lottie.dart';

import 'package:learning/screens_gp/register.dart';

class auth extends StatefulWidget {
  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  var EmailControllerA = TextEditingController();

  var PassControllerA = TextEditingController();

  var IsPassA =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,

        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(25) ,
                      bottomRight:Radius.circular(25) )
                ),
                height: MediaQuery.of(context).size.height*.50,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    // Text('Take your attendance professionally',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20,
                    //       color: Colors.black
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    Lottie.network('https://assets7.lottiefiles.com/packages/lf20_pfI6s6.json',height: 250,width: 600),

                    //Image.asset('assets/images/id.png',height: 230,),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [ TextFormField(
                              controller: EmailControllerA,
                              decoration: InputDecoration(
                                  labelText: 'Email address',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.mail)
                              )
                          ),
                            SizedBox(height: 10.0,),
                            TextFormField(
                              controller: PassControllerA,
                              onFieldSubmitted: (value){
                                print(value);
                              },
                              obscureText: IsPassA,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock_rounded),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (IsPassA==true){
                                        IsPassA=false;
                                      }else
                                        IsPassA=true;
                                    });
                                  },
                                  icon:IsPassA? Icon(Icons.remove_red_eye) :Icon(Icons.visibility_off),


                                ),

                              ),
                            ),
                            SizedBox(height: 15.0,),
                            Container(
                              width:double.infinity,
                              child: MaterialButton(onPressed:(){
                                print(EmailControllerA.text);
                                print(PassControllerA.text);
                              },
                                child: Text('LOGIN',
                                  style:
                                  TextStyle(color : Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.0,
                                    letterSpacing: 2,
                                  ),
                                ),
                                color: Colors.blue[700],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 7.0),
                                Text('don\'t have an account??'),
                                TextButton(onPressed: (){

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>  register()));
                                },
                                  child: Text('Register',style: TextStyle(color: Colors.blue[700]))
                                )
                              ],
                            )],
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login1.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  @override
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  var idController = TextEditingController();

  var IsPassA = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 600,
                      child: Image.asset(
                        'assets/images/shape1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 60,
                            child: TextField(
                              controller: userNameController,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff2827e9),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your User Name',
                                suffix: const Icon(
                                  Icons.text_format,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 300,
                            height: 60,
                            child: TextField(
                              controller: emailController,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff2827e9),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your Email',
                                suffix: const Icon(
                                  Icons.alternate_email,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 300,
                            height: 60,
                            child: TextField(
                              controller: idController,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff2827e9),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your Email',
                                suffix: const Icon(
                                  Icons.alternate_email,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 300,
                            height: 60,
                            child: TextFormField(
                              controller: passwordController,
                              autofocus: true,
                              obscureText: IsPassA,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff2827e9),
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enter Your Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (IsPassA == true) {
                                        IsPassA = false;
                                      } else {
                                        IsPassA = true;
                                      }
                                    });
                                  },
                                  icon: IsPassA
                                      ? const Icon(Icons.remove_red_eye)
                                      : const Icon(Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: const <Widget>[
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                ),
                                Text('I accept the policy and terms'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              userRegister(
                                name: userNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                StudId: idController.text,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login1()),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff5165ea),
                                      Color(0xff2827e9)
                                    ]),
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Image(
                          //       image: AssetImage('assets/images/icons8_Twitter_Circled_48px.png'),
                          //       width: 35,
                          //       height: 35,
                          //     ),
                          //     Image(
                          //       image: AssetImage('assets/images/google.png'),
                          //       width: 35,
                          //       height: 35,
                          //     ),
                          //     Image(
                          //       image: AssetImage('assets/images/icons8_LinkedIn_Circled_48px.png'),
                          //       width: 35,
                          //       height: 35,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String StudId,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    )
        .then((value) {
      userCreate(
          name: name, email: email, uId: value.user!.uid, StudId: StudId);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String uId,
    required String StudId,
  }) {
    FirebaseFirestore.instance.collection('users').doc(uId).set({
      'name': name,
      'email': email,
      'uId': uId,
      'StudId': StudId,
    }).then((value) {
      print('success');
    }).catchError((error) {
      print(error.toString());
    });
  }
}

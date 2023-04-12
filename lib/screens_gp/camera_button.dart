import 'package:flutter/material.dart';
import 'package:learning/screens_gp/live_camera.dart';

class Camera_button extends StatelessWidget {
  const Camera_button({Key? key}) : super(key: key);

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
                        'assets/images/shape2.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => liveHomepage()));
                      },
                      child: Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xff5165ea), Color(0xff2827e9)]),
                        ),
                        child: const Center(
                          child: Text(
                            'Take Attendance',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
}

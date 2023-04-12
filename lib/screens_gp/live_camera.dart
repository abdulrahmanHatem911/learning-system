// ignore_for_file: sdk_version_ui_as_code


import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import '../../../main.dart';
import 'camera_button.dart';




List<List<dynamic>> data = [];
bool isWorking = false;
int selectedColor = 0;
String colorName = "";
String colorMeaning = "";
CameraImage ?imgCamera;
CameraController ?cameraController;

// ignore: camel_case_types, use_key_in_widget_constructors
class liveHomepage extends StatefulWidget {
  @override
  State<liveHomepage> createState() => _liveHomepageState();
}

// ignore: camel_case_types
class _liveHomepageState extends State<liveHomepage> {
  loadModel() async {


    await Tflite.loadModel(
        model: "assets/model/DIDA.tflite", labels: "assets/model/labels.txt");
  }

  // ignore: missing_return
  Function ?liveCamera() {
    cameraController = CameraController(cameras![1], ResolutionPreset.medium);

    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }

      try {
        setState(() {
          // ignore: sdk_version_set_literal
          cameraController!.startImageStream((imageFromStream) => {
                if (!isWorking)
                  {isWorking = true, imgCamera = imageFromStream, detectColor()}
              });
        });
      } catch (e) {
        // ignore: avoid_print
        print('another error');
      }
    });
  }

  detectColor() async {
    if (imgCamera != null) {
      try {
        var recognitions = await Tflite.runModelOnFrame(
          bytesList: imgCamera!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: imgCamera!.height,
          imageWidth: imgCamera!.width,
          imageMean: 127.5,
          rotation: 90,
          numResults: 1,
          threshold: 0.1,
          asynch: true,
        );
        colorName = "";
        // ignore: avoid_function_literals_in_foreach_calls
        recognitions!.forEach((response) {
          colorName += response["label"];
        });
        setState(() {
          colorName;
        });

        setState(() {
          isWorking = false;
        });
        for (int i = 0; i < data.length; i++) {
          if (data[i][1] == colorName) {
            setState(() {
              colorMeaning = data[i][3];
              selectedColor = data[i][2];
            });
          }
        }
      } catch (e) {
        // ignore: avoid_print
        print('error i guess');
      }
    }
  }

  @override
  void initState() {
    isWorking = false;
    loadModel();
    liveCamera();
    super.initState();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // ignore: deprecated_member_use
            backwardsCompatibility: false,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: const Color.fromRGBO(42, 65, 88, 1.0),
            title: Text(
              'Live Camera',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 30,
                onPressed: () {
                  cameraController?.dispose();
                  super.dispose();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>Camera_button()

                  ));
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
            actions: [

            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Stack(children: [
                  Center(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      child: !cameraController!.value.isInitialized
                          ? Container()
                          : AspectRatio(
                              aspectRatio: cameraController!.value.aspectRatio,
                              child: CameraPreview(cameraController!),
                            ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          constraints:
                              const BoxConstraints(maxHeight: double.infinity),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(selectedColor),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          colorName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  colorMeaning,
                                  style: TextStyle(
                                    fontSize: 17.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

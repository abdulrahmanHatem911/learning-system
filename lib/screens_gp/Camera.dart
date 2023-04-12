import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/main.dart';
import 'package:tflite/tflite.dart';

class Camera extends StatefulWidget {


  @override
  State<Camera> createState() => _Camera();
}

class _Camera extends State<Camera> {
  bool isWorking = false;

  String result = "";

  late CameraController cameraController;

  CameraImage ?cameraImage;
  loadModel() async{
    await Tflite.loadModel(
        model: "assets/model/recognizer.tflite",
        labels: "assets/model/labels.txt"
    );
  }
  initCamera() {
    cameraController = CameraController(cameras![1], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imageFromStream) {
          if (!isWorking) {
            isWorking = true;
            cameraImage = imageFromStream;
            runCameraModel();
          }
        });
      });
    });
  }
  @override
  void initState() {
    super.initState();
    loadModel();
  }
  @override
  void dispose() async{
    super.dispose();
    await Tflite.close();
    cameraController.dispose();
  }
  runCameraModel()async{
    if(cameraImage !=null){
      var recognition =await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane){
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true
      );
      result = "";
      recognition!.forEach((output) {
        result=output['label'] + "  "+ (output['confidence'] as double).toStringAsFixed(2) +"\n\n";
      });
      setState(() {
        result;
      });
      isWorking = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              image: Image.asset("images/jarvis.jpg").image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 320,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("images/camera.jpg").image,
                  fit: BoxFit.fill),
            ),
            child: cameraImage == null
                ? Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                child: IconButton(
                    onPressed: () {
                      initCamera();
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 33,
                    )),
              ),
            )
                : Container(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: cameraController.value.aspectRatio,
                child: CameraPreview(cameraController),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(result,style: TextStyle(fontSize: 25.0,color: Colors.black),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

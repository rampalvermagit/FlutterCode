import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

Future<List<CameraDescription>> _getCameraList() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
   }

}
IconData getCameraLensIcon(CameraLensDirection direction){
   switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
}
class TakePhotoPage extends StatefulWidget {
  
  @override
    _TakePhotoPageState createState()  => new _TakePhotoPageState();
    
}

class _TakePhotoPageState extends State<TakePhotoPage> {
  CameraController controller;
String imagePath;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Photo'),
      ),
     body:FutureBuilder<List<CameraDescription>>(
        future: _getCameraList(),
         builder: (context, data) {
          return data.hasData ? _CameraViewPage(cameraList: data.data):
          Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _CameraViewPage extends StatelessWidget {
  final List<CameraDescription> cameraList;
   CameraController controller;
String imagePath;

final GlobalKey<ScaffoldState>  scaffoldKey;


  _CameraViewPage(
    {Key key, this.cameraList,
    this.controller, this.imagePath, this.scaffoldKey}
    ) : super(key: key);



Widget _cameraPreviewWidget(){
  if(controller == null || !controller.value.isInitialized){
    return const Text(
      'Tap on Camera icon to take snapshot',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,

      ),
    );
  }else{
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}

Widget _captureControlRowWidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.camera_alt),
        color:Colors.blue,
        onPressed: controller !=null && controller.value.isInitialized
        && !controller.value.isRecordingVideo ? onTakePictureButtonPressed:null,
      
      ),
    ],
  );

}
Widget _cameraTogglesRowWidget(){
  final List<Widget> toggles = <Widget>[];
  if (cameras.isEmpty){
    return const Text('NO Camera Available');
  }else {
    for(CameraDescription cameraDescription in cameras){
      toggles.add(
        SizedBox(
          width:85.0,
          child: RadioListTile<CameraDescription>(
            title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
            groupValue:controller?.description,
            value:cameraDescription,
            onChanged: controller != null && controller.value.isRecordingVideo?null:onNewCameraSelected,
          ),
        ),
      );
    }
  }
  return Row(children: toggles);
}

void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
     // if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    
  }
  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
     /* if (mounted) {
        setState(() {
          imagePath = filePath;
      
        });
        if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }*/
    });
  }


  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
   
     final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
  @override
  Widget build(BuildContext context) {
     return Column(
      children: <Widget>[
        Expanded(
          child:Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child:Container(
                child: _cameraPreviewWidget(), //CameraPreview
              ),
            ),
            decoration: BoxDecoration(
              color:Colors.blue,
              border: Border.all(
                color: controller != null && controller.value.isRecordingVideo ? Colors.redAccent : Colors.grey,
                width:3.0,
              ),
              ),
          ),
        ),
      _captureControlRowWidget(),
      Padding(
        padding:const EdgeInsets.all(5.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _cameraTogglesRowWidget(),
          ],
        ),
      ),
      ],
    );
  }
  
}
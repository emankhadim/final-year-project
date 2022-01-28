import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArViewScreeen extends StatefulWidget {
  String img;
  ArViewScreeen({this.img});

  @override
  _ArViewScreeenState createState() => _ArViewScreeenState();
}

class _ArViewScreeenState extends State<ArViewScreeen> {

  ArCoreController arCoreController;
  void whenArCoreViewCreated(ArCoreController controller){
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPlaneTap;
  }
  void controlOnPlaneTap(List<ArCoreHitTestResult> results){
    final hit= results.first;
    additemImageToScene(hit);
  }
  Future additemImageToScene( ArCoreHitTestResult hitresults) async{
    final bytes=(await rootBundle.load(widget.img)).buffer.asUint8List();
    final imageItem = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 600, height: 600),
      position: hitresults.pose.translation + vector.Vector3(0.0,0.0,0.0),
      rotation: hitresults.pose.rotation + vector.Vector4(0.0,0.0,0.0,0.0),
    );
    arCoreController.addArCoreNodeWithAnchor(imageItem);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: whenArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}


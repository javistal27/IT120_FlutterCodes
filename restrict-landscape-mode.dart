import 'package:flutter/material.dart';

//For using SystemChrome
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          title: Text("GeeksForGekks"),
        ),
        body: Center(
          child: Text(
            'This app can\'t be rotated to Landscape mode',
            style: TextStyle(color: Colors.green, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

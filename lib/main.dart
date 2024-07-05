import 'package:ads/home.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
void main()async {
WidgetsFlutterBinding.ensureInitialized();
await MobileAds.instance.initialize();
var device = ["9724FF40791B912365E319153A6B3688"];
RequestConfiguration requestConfiguration = RequestConfiguration(
  testDeviceIds: device
);
MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}


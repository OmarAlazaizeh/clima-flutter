import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    determinePosition();
  }

  void getData() async {
    const apiKey = '4801725066804915e64f5b4c67d54ed2';
    Response response = await get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather?lat=44.34&lon=10.99&appid=$apiKey',
      ),
    );

    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}

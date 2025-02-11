import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '4801725066804915e64f5b4c67d54ed2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // double latitude;
  // double longitude;

  @override
  void initState() {
    super.initState();

    // determinePosition();

    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitud);
    print(location.longitud);
  }

  void getData() async {
    var uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '44.34',
        'lon': '10.99',
        'appid': apiKey,
      },
    );

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;

      var temp = jsonDecode(data)['main']['temp'];
      var condition = jsonDecode(data)['weather'][0]['id'];
      var city = jsonDecode(data)['name'];

      print(temp);
      print(condition);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}

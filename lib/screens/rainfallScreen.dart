import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:tri_rim/components/rainfall/chart.dart';
import '../services/locationService.dart';

class RainfallScreen extends StatefulWidget {
  const RainfallScreen({super.key});

  @override
  State<RainfallScreen> createState() => _RainfallScreenState();
}

class _RainfallScreenState extends State<RainfallScreen> {

  late LocationData _locationData;

  // State variables
  bool _isGetLocation = false;
  double? latitude = 0;
  double? longitude = 0;
  List time = [];
  List rain_sum = [];

  // API request
  fetchData() async {

    final now = DateTime.now();
    final df = new DateFormat('yyyy-MM-dd');
    final startdate = df.format(now.subtract(Duration(days: 1830)));
    final enddate = df.format(now.subtract(Duration(days: 10)));

    final url = "https://archive-api.open-meteo.com/v1/archive?latitude=${latitude}&longitude=${longitude}&start_date=${startdate}&end_date=${enddate}&daily=rain_sum&timezone=Asia%2FBangkok";
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      rain_sum = jsonData["daily"]["rain_sum"];
      return 1;
    } catch(error) {}
  }

  void getLocation() async {
    _locationData = await locationService();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
    _isGetLocation = true;
    setState(() {});
    var returnValue = await fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AgriTech - Rainfall", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white54, //change your color here
        ),
      ),
      body:
      _isGetLocation
          ? rain_sum.length!=0 ? Center(
              child: Chart(rain_sum: rain_sum,)
          ) : Center(child: CircularProgressIndicator(color: Colors.black87,))
          : Center(
            child: ElevatedButton(
              onPressed: getLocation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Locate", style: TextStyle(color: Colors.white60, fontSize: 20),),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
            ),
          )
    );
  }
}

import 'package:location/location.dart';

Location location = Location();
late bool _seviceEnabled;
late PermissionStatus _permissionGranted;
late LocationData _locationData;

locationService() async {

  _seviceEnabled = await location.serviceEnabled();
  if(!_seviceEnabled) {
    _seviceEnabled = await location.requestService();
    if(!_seviceEnabled) return;
  }

  _permissionGranted = await location.hasPermission();
  if(_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if(_permissionGranted != PermissionStatus.granted) return;
  }
  _locationData = await location.getLocation();
  return _locationData;
}
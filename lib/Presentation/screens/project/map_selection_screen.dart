import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapSelectionScreen extends StatefulWidget {
  const MapSelectionScreen({super.key});

  @override
  State<MapSelectionScreen> createState() => _MapSelectionScreenState();
}

class _MapSelectionScreenState extends State<MapSelectionScreen> {
  final MapController mapController = MapController();

  LatLng currentPosition = LatLng(22.5726, 88.3639); // default
  String address = "Fetching address...";
  

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
    });

    mapController.move(currentPosition, 15);
    getAddressFromLatLng();
  }

  Future<void> getAddressFromLatLng() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    );

    final place = placemarks.first;

    setState(() {
      address = "${place.name}, ${place.locality}, ${place.administrativeArea}";
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Location")),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: currentPosition,
              initialZoom: 15,
              onPositionChanged: (position, hasGesture) {
                currentPosition = position.center!;
                getAddressFromLatLng();
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.bocw_contractor_app',
                maxZoom: 19,
              ),
            ],
          ),
          const Center(
            child: Icon(Icons.location_on, size: 40, color: Colors.red),
          ),
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(address, style: const TextStyle(fontSize: 12)),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  "lat": currentPosition.latitude,
                  "lng": currentPosition.longitude,
                  "address": address,
                });
              },
              child: const Text("Select Location"),
            ),
          ),
        ],
      ),
    );
  }
}

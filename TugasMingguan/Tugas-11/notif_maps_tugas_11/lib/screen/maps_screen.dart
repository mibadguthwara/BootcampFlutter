import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Flutter"),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Menampilkan lokasi Sanber Foundation",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Lat: -6.8902378"),
                  Text("Long: 107.5802125"),
                  Text(
                      "Jl. Sukasari I No.4, Sukawarna, Kec. Sukajadi, Kota Bandung, Jawa Barat 40161"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-6.8902378, 107.5802125),
                zoom: 14,
              ),
              markers: _markers,
              onMapCreated: (controller) {
                _controller = controller;
                setState(
                  () {
                    _markers.add(
                      Marker(
                        markerId: const MarkerId("1"),
                        position: const LatLng(-6.8902378, 107.5802125),
                        onTap: () {
                          _showInfoWindow();
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showInfoWindow() {
    _controller?.showMarkerInfoWindow(const MarkerId("1"));
  }
}

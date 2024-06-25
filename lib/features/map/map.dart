import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:med_dos/core/model/position.dart';



class MapSample extends StatefulWidget {
  Position position;
  MapSample({required this.position});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.position.lat,widget. position.lan),
          zoom: 14.4746,
        ),

myLocationButtonEnabled: true,
        markers: {
          Marker(markerId: MarkerId("gg"),position:LatLng(widget.position.lat,widget. position.lan), )

        },
      ),

    );
  }
}
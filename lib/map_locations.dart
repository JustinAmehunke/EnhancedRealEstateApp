import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_horiziontal.dart';
import 'colorscheme.dart';


class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  final Set<Marker> _markers = {};
  static const LatLng _center = LatLng(5.595776,-0.223597);
  LatLng _lastMapPosition = _center;


  late GoogleMapController _controller;
  final PageController _pageController =
  PageController(initialPage: 0, viewportFraction: 0.85);
  int _currentPage = 0;

  final Set<Marker> _marker = {};

  onMarkerTap(int position) {
    setState(() {
      _currentPage = position;
    });

    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  onPageChange(int position) {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _marker.toList()[position].position, zoom: 10.5)));
  }
  @override
  void initState() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(5.595997,-0.222660),
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(5.595192,-0.223580),
          icon: BitmapDescriptor.defaultMarker));

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(0),
              child: GoogleMap(
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                  markers: _markers,
                  initialCameraPosition:
                  CameraPosition(target: _center, zoom: 11.0),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  onTap: (coordinates) => _controller
                      .animateCamera(CameraUpdate.newLatLng(coordinates))),
            ),

            Align(
                alignment: Alignment.bottomCenter,
                 child:Container(height: 160,
                    padding: EdgeInsets.only(bottom: 18.0),
                    child: listOfLocations())
            )
          ],
        ),
      ),
    );
  }
}

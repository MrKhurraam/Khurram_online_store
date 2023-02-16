import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../models/sub_category_model.dart';
import '../services/category_selection_Service.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/map_bottom_pill.dart';
import '../widgets/map_user_badge.dart';

const LatLng SOURCE_LOCATION = LatLng(33.594203, 73.050002);
const LatLng DESTINATION_LOCATION = LatLng(33.593992, 73.056295);
const double CAMERA_ZOOM = 15;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);
  late SubCategory subCategory;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;
  late LatLng currentLocation;
  late LatLng destinationLocation;
  bool userBadgeSelected = false;

  // creating polyline set because we can have more than 1 polyline
  Set<Polyline> _polylines = Set<Polyline>();

  // this list will contain the cordinate of each polyline
  List<LatLng> _polylineCoordinates = [];

  // this varible will be use to store the cordinate
  // after getting them from directional api
  late PolylinePoints polylinePoints;

  List<LatLng> latlngSegment1 = [];
  List<LatLng> latlngSegment2 = [];
  static LatLng _lat1 = LatLng(33.594203, 73.050002);
  static LatLng _lat2 = LatLng(33.593530, 73.051004);
  static LatLng _lat3 = LatLng(33.592803, 73.051909);
  static LatLng _lat4 = LatLng(33.592023, 73.052878);
  static LatLng _lat5 = LatLng(33.591565, 73.053557);
  static LatLng _lat6 = LatLng(33.591681, 73.053692);
  static LatLng _lat7 = LatLng(33.591774, 73.053851);
  static LatLng _lat8 = LatLng(33.592354, 73.054447);
  static LatLng _lat9 = LatLng(33.592867, 73.054993);
  static LatLng _lat10 = LatLng(33.593471, 73.055679);
  static LatLng _lat11 = LatLng(33.593992, 73.056295);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.setInitialLocation();
    polylinePoints = PolylinePoints();
  }

  setInitialLocation() {
    currentLocation = SOURCE_LOCATION;
    destinationLocation = DESTINATION_LOCATION;
  }

  setSourceAndDestinationMarkerIcon(BuildContext context) async {
    //getting selected sub categary name
    String parentCat = widget.subCategory.imgName.split("_")[0];

    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/source_pin${Utils.deviceSuffix(context)}.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0),
        'assets/imgs/destination_pin_${parentCat}${Utils.deviceSuffix(context)}.png');
  }

  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    widget.subCategory = catSelection.selectedSubCategory!;

    this.setSourceAndDestinationMarkerIcon(context);

    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                myLocationEnabled: true,
                tiltGesturesEnabled: false,
                // compassEnabled: false,
                markers: _markers,
                polylines: _polylines,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onTap: (LatLng loc) {
                  setState(() {
                    this.pinPillPosition = PIN_INVISIBLE_POSITION;
                    this.userBadgeSelected = false;
                  });
                },

                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  showPinsOnMap();
                  setPolylines();
                },
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: MapUserBadge(
                isSelected: this.userBadgeSelected,
              ),
            ),
            AnimatedPositioned(
              bottom: this.pinPillPosition,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: MapBottomPill(),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MainAppBar(),
            ),
          ],
        ),
      ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          infoWindow: InfoWindow(title: 'SourcePin'),
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          onTap: () {
            setState(() {
              this.userBadgeSelected = true;
            });
          },
          icon: sourceIcon));
      _markers.add(
        Marker(
            infoWindow: InfoWindow(title: 'DestinationPin'),
            markerId: MarkerId('destinationPin'),
            position: destinationLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                this.pinPillPosition = PIN_VISIBLE_POSITION;
              });
            }),
      );
    });
  }

  void setPolylines() async {
//getting points between 2 cordinates using direction api
//   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyBflJzv095G522rChKR1x1o0Vn48CGQZog',
//       PointLatLng(currentLocation.latitude, currentLocation.longitude),
//       PointLatLng(
//           destinationLocation.latitude, destinationLocation.longitude));

// adding those coordinates in a list to make
//   if (result.status == 'OK') {
//     result.points.forEach((PointLatLng point) {
//       _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//     });
//   }

    // as i dont have direction api key, so i use static coordinates
    _polylineCoordinates.add(_lat1);
    _polylineCoordinates.add(_lat2);
    _polylineCoordinates.add(_lat3);
    _polylineCoordinates.add(_lat4);
    _polylineCoordinates.add(_lat5);
    _polylineCoordinates.add(_lat6);
    _polylineCoordinates.add(_lat7);
    _polylineCoordinates.add(_lat8);
    _polylineCoordinates.add(_lat9);
    _polylineCoordinates.add(_lat10);
    _polylineCoordinates.add(_lat11);

// adding list of combines coordinates into set to draw that polyline
//     _polylines.add(Polyline(
//       polylineId: PolylineId('line1'),
//       visible: true,
//       //latlng is List<LatLng>
//       points: latlngSegment1,
//       width: 10,
//       color: Colors.blue,
//     ));

    setState(() {
      _polylines.add(Polyline(
        // visible: true,
        width: 10,
        polylineId: PolylineId('polyline'),
        color: Color(0xFF08A5CB),
        points: _polylineCoordinates,
      ));
    });
  }
}

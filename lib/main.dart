import 'dart:async';
//\\\ import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/service/location_service.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application_1/page/login_page.dart';
import 'package:flutter_application_1/page/splash_screen.dart';
// import 'package:flutter_application_1/page/registration_page.dart';
//import 'package:flutter_application_1/page/_page.dart'

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uni Finder Me',
      home: LoginPage(),
    );
  }
}

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   TextEditingController _originController = TextEditingController();
//   TextEditingController _destinationController = TextEditingController();

//   Set<Marker> _markers = Set<Marker>();
//   Set<Polygon> _polygons = Set<Polygon>();
//   Set<Polyline> _polylines = Set<Polyline>();
//   List<LatLng> polygonLatLngs = <LatLng>[];

//   int _polygonIdCounter = 1;
//   int _polylineIdCounter = 1;

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     // target: LatLng(37.42796133580664, -122.085749655962),
//     target: LatLng(13.7944, 100.3256),
//     zoom: 14.4746,
//   );

//   @override
//   void initState() {
//     super.initState();
//     _setMarker(LatLng(13.7944, 100.3256));
//   }

//   void _setMarker(LatLng point) {
//     setState(() {
//       _markers.add(
//         Marker(markerId: MarkerId('marker'), position: point),
//       );
//     });
//   }

//   void _setPolygon() {
//     final String polygonIdVal = 'polygon_$_polygonIdCounter';
//     _polygonIdCounter++;

//     _polygons.add(
//       Polygon(
//         polygonId: PolygonId(polygonIdVal),
//         points: polygonLatLngs,
//         strokeWidth: 2,
//         fillColor: Colors.transparent,
//       ),
//     );
//   }

//   void _setPolyline(List<PointLatLng> points) {
//     final String polylineIdVal = 'polyline_$_polylineIdCounter';
//     _polylineIdCounter++;

//     _polylines.add(
//       Polyline(
//         polylineId: PolylineId(polylineIdVal),
//         width: 2,
//         color: Colors.blue,
//         points: points
//             .map(
//               (point) => LatLng(point.latitude, point.longitude),
//             )
//             .toList(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(
//     //   debugShowCheckedModeBanner: false,
//     //   home: LoginPage(),
//     // );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Uni Finder Me'),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _originController,
//                       //textCapitalization: TextCapitalization.words,
//                       decoration: InputDecoration(hintText: 'Origin'),
//                       onChanged: (value) {
//                         print(value);
//                       },
//                     ),
//                     TextFormField(
//                       controller: _destinationController,
//                       //textCapitalization: TextCapitalization.words,
//                       decoration: InputDecoration(hintText: 'Destination'),
//                       onChanged: (value) {
//                         print(value);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//               IconButton(
//                 onPressed: () async {
//                   var directions = await LocationService().getDirections(
//                     _originController.text,
//                     _destinationController.text,
//                   );
//                   _goToPlace(
//                     directions['start_location']['lat'],
//                     directions['start_location']['lng'],
//                     directions['bounds_ne'],
//                     directions['bounds_sw'],
//                   );

//                   _setPolyline(directions['polyline_decoded']);
//                 },
//                 icon: Icon(Icons.search),
//               ),
//             ],
//           ),
//           Expanded(
//             child: GoogleMap(
//               mapType: MapType.normal,
//               markers: _markers,
//               polygons: _polygons,
//               polylines: _polylines,
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//               onTap: (point) {
//                 setState(() {
//                   polygonLatLngs.add(point);
//                   _setPolygon();
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );

//     //  return MaterialApp(
//     //   debugShowCheckedModeBanner: false,
//     //   home: loginPage(),
//     // );
//   }

//   Future<void> _goToPlace(
//     // Map<String, dynamic> place,
//     double lat,
//     double lng,
//     Map<String, dynamic> boundsNE,
//     Map<String, dynamic> boundsSw,
//   ) async {
//     //final double lat = place['geometry']['location']['lat'];
//     //final double lng = place['geometry']['location']['lng'];

//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: LatLng(lat, lng), zoom: 30),
//       ),
//     );
//     controller.animateCamera(
//       CameraUpdate.newLatLngBounds(
//           LatLngBounds(
//               southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
//               northeast: LatLng(boundsNE['lat'], boundsNE['lng'])),
//           25),
//     );

//     _setMarker(LatLng(lat, lng));
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/jahangirnagar_university.png');
  }

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          icon: mapMarker,
          position: LatLng(23.879757703425565, 90.27263336803614),
          infoWindow: InfoWindow(
            title: 'Jahangrinagar University',
            snippet: 'Educational Center',
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map API"),
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(23.879757703425565, 90.27263336803614),
            zoom: 15,
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

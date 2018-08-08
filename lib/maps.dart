import 'dart:async';

import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => new _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider =
      new StaticMapProvider("AIzaSyB4v8z5oLnWyEFbSbfusEB0jjznBB9NSa8");
  Uri staticMapUri;

  //Marker bubble
  List<Marker> _markers = <Marker>[
    new Marker(
      "1",
      "Wordpress Cafe!",
      36.103079,
      129.388451,
    ),
  ];

  @override
  initState() {
    super.initState();
    cameraPosition = new CameraPosition(Location(36.103079, 129.388451), 15.0);
    staticMapUri = staticMapProvider.getStaticUriWithMarkers(_markers,
        center: Location(36.103079, 129.388451),
        width: 900,
        height: 400,
        maptype: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(bottom: 10.0),
          child: new Text(
            "현재위치를 확인하시려면 맵을 클릭하세요.",
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          // height: 250.0,
          child: new Stack(
            children: <Widget>[
              new Center(
                  child: new Container(
                child: new Text(
                  "You are supposed to see a map here.\n\nAPI Key is not valid.\n\n"
                      "To view maps in the example application set the "
                      "API_KEY variable in example/lib/main.dart. "
                      "\n\nIf you have set an API Key but you still see this text "
                      "make sure you have enabled all of the correct APIs "
                      "in the Google API Console. See README for more detail.",
                  textAlign: TextAlign.center,
                ),
                padding: const EdgeInsets.all(20.0),
              )),
              new InkWell(
                child: new Center(
                  child: new Image.network(staticMapUri.toString()),
                ),
                onTap: showMap,
              )
            ],
          ),
        ),
      ],
    );
  }

  showMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            showMyLocationButton: true,
            showCompassButton: true,
            initialCameraPosition:
                new CameraPosition(new Location(36.103079, 129.388451), 16.0),
            hideToolbar: false,
            title: "매장 위치"),
        toolbarActions: [new ToolbarAction("Close", 1)]);
    StreamSubscription sub = mapView.onMapReady.listen((_) {
      mapView.setMarkers(_markers);
    });
    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub);
    sub = mapView.onToolbarAction.listen((id) {
      print("Toolbar button id = $id");
      if (id == 1) {
        _handleDismiss();
      }
    });
    compositeSubscription.add(sub);
  }

  _handleDismiss() async {
    double zoomLevel = await mapView.zoomLevel;
    Location centerLocation = await mapView.centerLocation;
    List<Marker> visibleAnnotations = await mapView.visibleAnnotations;
    print("Zoom Level: $zoomLevel");
    print("Center: $centerLocation");
    print("Visible Annotation Count: ${visibleAnnotations.length}");
    var uri = await staticMapProvider.getImageUriFromMap(mapView,
        width: 900, height: 400);
    setState(() => staticMapUri = uri);
    mapView.dismiss();
    compositeSubscription.cancel();
  }
}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}

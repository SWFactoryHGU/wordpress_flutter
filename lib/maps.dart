import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'widgets/helpers/ensure_visible.dart';

class LocationInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  Uri _staticMapUri;
  final FocusNode _addressInputFocusNode = FocusNode();

  @override
  void initState() {
    _addressInputFocusNode.addListener(_updateLocation);
    getStaticMap();
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  void getStaticMap() {
    final StaticMapProvider staticMapViewProvider = StaticMapProvider("AIzaSyBfxmlresQeAP9g1anqjnyc1NQ5vpy8v-U");
    final Uri staticMapUri = staticMapViewProvider.getStaticUriWithMarkers(
        [Marker('position', 'Position', 36.103079, 129.388451)],
        center: Location(36.103079, 129.388451),
        width: 500,
        height:  300,
        maptype: StaticMapViewType.roadmap);
    setState(() {
      _staticMapUri = staticMapUri;
    });
  }

  void _updateLocation() {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        EnsureVisibleWhenFocused(
          focusNode: _addressInputFocusNode,
          child: TextFormField(
            focusNode: _addressInputFocusNode,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Image.network(_staticMapUri.toString())
      ],
    );
  }
}

import 'package:avto_hamyon/dialogs/custom_simple_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CustomMapDialog extends StatefulWidget {
  final Point? placePoint;
  final Point? point;
  final double zoom;
  final bool myCurrent;
  final MapAnimation animation;
  final Function(Point? point, double zoom, List<SearchSessionResult> list)?
      callback;

  const CustomMapDialog._({
    Key? key,
    this.callback,
    this.placePoint,
    this.point,
    this.myCurrent = true,
    this.animation = const MapAnimation(duration: 0.5),
    required this.zoom,
  }) : super(key: key);

  static Future<void> show(
    BuildContext context, {
    Function(Point? point, double zoom, List<SearchSessionResult> list)?
        callback,
    Point? placePoint,
    Point? point,
    bool myCurrent = true,
    MapAnimation animation = const MapAnimation(duration: 0.5),
    double zoom = 14,
  }) async {
    FocusScope.of(context).unfocus();
    await showDialog(
      context: context,
      builder: (context) => CustomMapDialog._(
        callback: callback,
        point: point,
        placePoint: placePoint,
        myCurrent: myCurrent,
        zoom: zoom,
        animation: animation,
      ),
    );
  }

  @override
  _CustomMapDialogState createState() => _CustomMapDialogState();
}

class _CustomMapDialogState extends State<CustomMapDialog> {
  late YandexMapController controller;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 0.5);

  Future<void> checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = LocationPermission.denied;

    if (!serviceEnabled) {
      await CustomSimpleDialog.show(
        context,
        text: "Joylashuvni aniqlash uchun GPSni yoqing",
        onTapOk: () async {
          await GeolocatorPlatform.instance.openLocationSettings();
          Navigator.pop(context);
        },
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
  }

  Future<Point?> getPoint() async {
    await checkPermission();
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
        timeLimit: const Duration(seconds: 10),
      );
    } catch (_) {}
    if (position == null) return null;
    return Point(latitude: position.latitude, longitude: position.longitude);
  }

  Future<void> setCurrentLocation({double? zoom}) async {
    final point = await getPoint();
    if (point != null) {
      await controller.moveCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: point, zoom: zoom ?? await controller.getMaxZoom())),
          animation: animation);
      // await controller.move(
      //   point: point,
      //   animation: widget.animation,
      //   zoom: zoom ?? await controller.getMaxZoom(),
      // );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<SearchSessionResult> results = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height * 0.75;
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Divider(color: Color(0xFFCECECE)),
                Expanded(
                  child: Stack(
                    children: [
                      YandexMap(
                        onMapTap: (point) async {
                          await controller.moveCamera(
                              CameraUpdate.newCameraPosition(
                                  CameraPosition(target: point)),
                              animation: animation);
                        },
                        onMapCreated: (controller) async {
                          this.controller = controller;
                          // await controller.logoAlignment(
                          //   horizontal: HorizontalAlignment.right,
                          //   vertical: VerticalAlignment.top,
                          // );
                          // await controller.setMapStyle(
                          //   PlacemarkStyle(
                          //     iconName: 'assets/img/map_marker.png',
                          //     opacity: 0.7,
                          //     scale: 0.6,
                          //   ),
                          //   onCameraPositionChange: (msg) async {},
                          // );
                          // await controller.setBounds(
                          //     southWestPoint: const Point(
                          //       latitude: 39,
                          //       longitude: 56,
                          //     ),
                          //     northEastPoint: const Point(
                          //       latitude: 44,
                          //       longitude: 72,
                          //     ));
                          await Future.delayed(const Duration(seconds: 1));
                          // if (widget.placePoint != null) {
                          //   await controller.addPlacemark(Placemark(
                          //     point: widget.placePoint!,
                          //     style: const PlacemarkStyle(
                          //       iconName: 'assets/img/map_logo.png',
                          //       opacity: 0.7,
                          //       scale: 0.7,
                          //     ),
                          //   ));
                          // }
                          if (widget.point != null) {
                            await controller.moveCamera(
                                CameraUpdate.newCameraPosition(
                                    CameraPosition(target: widget.point!)),
                                animation: animation);
                          }
                          if (widget.myCurrent) {
                            setCurrentLocation(zoom: widget.zoom);
                          }
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 36,
                            height: 36,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                ))),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: GestureDetector(
                          onTap: setCurrentLocation,
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 4)
                                ]),
                            child: const Icon(
                              Icons.my_location,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color(0xFFCECECE)),
                CupertinoButton(
                  child: const Text("OK"),
                  padding: const EdgeInsets.all(0),
                  onPressed: () async {
                    if (widget.callback != null) {
                      final cameraPosition =
                          await controller.getCameraPosition();

                      final zoom = await controller.getMaxZoom();
                      final resultWithSession = YandexSearch.searchByPoint(
                        point: cameraPosition.target,
                        zoom: cameraPosition.zoom.toInt(),
                        searchOptions: const SearchOptions(
                          searchType: SearchType.geo,
                          geometry: false,
                        ),
                      );
                      _convertResult(await resultWithSession.result);
                      widget.callback!(
                        cameraPosition.target,
                        zoom,
                        results,
                      );
                      // await YandexSearch.getSuggestions(
                      //   address: '',
                      //   southWestPoint: point,
                      //   northEastPoint: point,
                      //   suggestType: SuggestType.unspecified,
                      //   suggestWords: true,
                      //   onSuggest: (List<SuggestItem> list) async {
                      //     widget.callback!(point, zoom, list);
                      //   },
                      // );
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _convertResult(SearchSessionResult result) async {
    setState(() {
      results.add(result);
    });
  }
}

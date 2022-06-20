import 'package:avto_hamyon/dialogs/custom_simple_dialog.dart';
import 'package:avto_hamyon/pages/map/on_map_tabbar_page.dart';
import 'package:avto_hamyon/widgets/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class RadiusMapPage extends StatefulWidget {
  const RadiusMapPage({Key? key, required this.isWorker}) : super(key: key);
  final bool isWorker;

  @override
  State<RadiusMapPage> createState() => _RadiusMapPageState();
}

class _RadiusMapPageState extends State<RadiusMapPage> {
  late YandexMapController controller;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 0.5);
  List<MapObject> mapObjects = [];

  @override
  void initState() {
    setCurrentLocation();
    // loadMapObjects();
    super.initState();
  }

  String currentAddress = '';
  double valueHolder = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Stack(
                          alignment: Alignment.center,
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
                                await Future.delayed(
                                    const Duration(seconds: 1));
                              },
                              mapObjects: mapObjects,
                              onCameraPositionChanged:
                                  (position, reason, changed) {
                                _convertResult();
                              },
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.withOpacity(0.3),
                                  ),
                                ),
                                SizedBox(
                                    width: 36,
                                    height: 36,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                            'assets/img/location.png'))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: FloatingActionButton.small(
                              onPressed: () {
                                setCurrentLocation();
                              },
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, right: 12, left: 8, top: 8),
                                child: Image.asset('assets/img/current.png'),
                              )),
                        ),
                        const SizedBox(height: 34),
                        Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                          ),
                          margin: EdgeInsets.zero,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32.0,
                                      right: 32.0,
                                      top: 16,
                                      bottom: 18),
                                  child: Row(
                                    children: [
                                      const ImageIcon(
                                        AssetImage('assets/img/location_2.png'),
                                        size: 28,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 14),
                                      Text(
                                        currentAddress,
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 11, right: 11),
                                  height: 1,
                                  color: const Color(0XffC8C8C8),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32.0,
                                      right: 32.0,
                                      bottom: 16.0,
                                      top: 18),
                                  child: Row(
                                    children: [
                                      const ImageIcon(
                                        AssetImage('assets/img/radius.png'),
                                        size: 28,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Qidiruv radiusi ${double.parse((valueHolder).toStringAsFixed(2))} km ',
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Slider.adaptive(
                                  value: valueHolder.toDouble(),
                                  activeColor: Colors.blue,
                                  onChangeEnd: (double radius) async {
                                    _convertResult();
                                  },
                                  onChanged: (double newValue) {
                                    controller.moveCamera(CameraUpdate.zoomTo(
                                        (20 - newValue) / 3.95 + 10));
                                    setState(
                                      () {
                                        valueHolder = newValue;
                                      },
                                    );
                                  },
                                  min: 1.0,
                                  max: 20.0,
                                  divisions: 100,
                                ),
                                SimpleButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (_) => OnMapTabBarPage(
                                            isWorker:
                                                widget.isWorker == true ? 1 : 0,
                                            radius: double.parse((valueHolder)
                                                .toStringAsFixed(2)),
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'Joylar')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setCurrentLocation({double? zoom}) async {
    setState(() {
      valueHolder = 1;
    });
    final point = await getPoint();
    if (point != null) {
      await controller.moveCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(target: point, zoom: zoom ?? 14)),
          animation: animation);
      // await controller.move(
      //   point: point,
      //   animation: widget.animation,
      //   zoom: zoom ?? await controller.getMaxZoom(),
      // );
    }
  }

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
      await CustomSimpleDialog.show(
        context,
        text: "Joylashuvni aniqlash uchun GPSga ruxsat berishingiz kerak",
        onTapOk: () async {
          await GeolocatorPlatform.instance.openAppSettings();
          Navigator.pop(context);
        },
      );
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await CustomSimpleDialog.show(
          context,
          text: "Joylashuvni aniqlash uchun GPSga ruxsat berishingiz kerak",
          onTapOk: () async {
            await GeolocatorPlatform.instance.openAppSettings();
            Navigator.pop(context);
          },
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await CustomSimpleDialog.show(
        context,
        text: "Joylashuvni aniqlash uchun GPSga ruxsat berishingiz kerak",
        onTapOk: () async {
          await GeolocatorPlatform.instance.openAppSettings();
        },
      );
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

  Future<void> _convertResult() async {
    final cameraPosition = await controller.getCameraPosition();

    final resultWithSession = YandexSearch.searchByPoint(
      point: cameraPosition.target,
      zoom: cameraPosition.zoom.toInt(),
      searchOptions: const SearchOptions(
        searchType: SearchType.geo,
        geometry: false,
      ),
    );
    SearchSessionResult result = await resultWithSession.result;
    setState(
      () {
        if (result.items != null) {
          if (result.items!.isNotEmpty) {
            currentAddress = result.items![1].name;
          }
        }
      },
    );
  }
}

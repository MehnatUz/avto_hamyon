import 'dart:typed_data';
import 'dart:ui';

import 'package:avto_hamyon/pages/map/radius_map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class OnMapPage extends StatefulWidget {
  const OnMapPage(
      {Key? key, required this.isWorkers,})
      : super(key: key);
  final bool isWorkers;

  @override
  State<OnMapPage> createState() => _OnMapPageState();
}

class _OnMapPageState extends State<OnMapPage> {
  late YandexMapController controller;
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 1);
  double valueHolder = 20;
  List<MapObject> mapObjects = [];
  final MapObjectId largeClusterizedPlacemarkCollectionId =
      const MapObjectId('large_clusterized_placemark_collection');

  @override
  void initState() {
    setCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    // loadMapObjects();

    return SafeArea(
        child: Scaffold(
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
                  alignment: Alignment.bottomCenter,
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
                        await Future.delayed(const Duration(seconds: 1));
                      },
                      mapObjects: mapObjects,
                      onCameraPositionChanged: (CameraPosition cameraPosition,
                          CameraUpdateReason reason, bool finished) {
                        setState(() {
                          valueHolder = 20 - cameraPosition.zoom;
                        });
                      },
                    ),
                    Positioned(
                      right: 10,
                      bottom: MediaQuery.of(context).size.height * 0.05,
                      child: Column(
                        children: [
                          FloatingActionButton.small(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (_) => RadiusMapPage(
                                        isWorker: widget.isWorkers),
                                  ),
                                );
                              },
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Image.asset(
                                  'assets/img/radius.png',
                                  width: 28,
                                  height: 28,
                                ),
                              )),
                          const SizedBox(height: 8),
                          FloatingActionButton.small(
                              onPressed: () {
                                setCurrentLocation();
                              },
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/img/current.png'),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void makeCollection(List list, int isWorker) {
    if (list.isNotEmpty) {
      if (isWorker == 1) {
        final clusterizedPlacemarkCollection = ClusterizedPlacemarkCollection(
          mapId: largeClusterizedPlacemarkCollectionId,
          radius: 30,
          minZoom: 15,
          onClusterAdded:
              (ClusterizedPlacemarkCollection self, Cluster cluster) async {
            return cluster.copyWith(
                appearance: cluster.appearance.copyWith(
                    onTap: (placemark, point) async {
                      await controller.moveCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                            target: point,
                          )),
                          animation: animation);
                      await controller.moveCamera(CameraUpdate.zoomIn(),
                          animation: animation);
                      // CustomInfoDialog.show(context, text: list[i].fullName);
                    },
                    opacity: 0.75,
                    icon: PlacemarkIcon.single(PlacemarkIconStyle(
                        image: BitmapDescriptor.fromBytes(
                            await _buildClusterAppearance(cluster)),
                        scale: 1))));
          },
          onClusterTap: (ClusterizedPlacemarkCollection self, Cluster cluster) {
            print('Tapped cluster');
          },
          placemarks: List<Placemark>.generate(list.length, (i) {
            return Placemark(
                onTap: (placemark, point) {
                  // print('Tapped MEEEEEEEEEEEE');
                  //
                  // controller.moveCamera(
                  //     CameraUpdate.newCameraPosition(
                  //         CameraPosition(target: point)),
                  //     animation: animation);
                  // MapDialog.show(context,
                  //     image: list[i].profilePhotoPath,
                  //     name: list[i].fullName,
                  //     id: list[i].userId,
                  //     specialist: list[i].specialist,
                  //     adress: double.parse(list[i].distance),
                  //     age: list[i].age);
                },
                mapId: MapObjectId('placemark_$i'),
                point: Point(
                    latitude: double.parse(list[i].latitude ?? '0.0'),
                    longitude: double.parse(list[i].longitude ?? '0.0')),
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/img/worker_placemark.png'),
                    scale: 1)));
          }),
          onTap: (ClusterizedPlacemarkCollection self, Point point) =>
              print('Tapped me at $point'),
        );
        setState(() {
          mapObjects.add(clusterizedPlacemarkCollection);
        });
      } else {
        final clusterizedPlacemarkCollection = ClusterizedPlacemarkCollection(
          mapId: largeClusterizedPlacemarkCollectionId,
          radius: 30,
          minZoom: 15,
          onClusterAdded:
              (ClusterizedPlacemarkCollection self, Cluster cluster) async {
            return cluster.copyWith(
                appearance: cluster.appearance.copyWith(
                    opacity: 0.75,
                    icon: PlacemarkIcon.single(PlacemarkIconStyle(
                        image: BitmapDescriptor.fromBytes(
                            await _buildClusterAppearance(cluster)),
                        scale: 1))));
          },
          onClusterTap: (ClusterizedPlacemarkCollection self, Cluster cluster) {
            if (kDebugMode) {
              print('Tapped cluster');
            }
          },
          placemarks: List<Placemark>.generate(list.length, (i) {
            return Placemark(
                onTap: (placemark, point) {
                  // controller.moveCamera(
                  //     CameraUpdate.newCameraPosition(
                  //         CameraPosition(target: point)),
                  //     animation: animation);
                  // MapWorkDialog.show(context,
                  //     adress: double.parse(list[i].distance),
                  //     id: list[i].id,
                  //     name: list[i].fullName);
                },
                mapId: MapObjectId('placemark_$i'),
                point: Point(
                    latitude: double.parse(list[i].latitude ?? '0.0'),
                    longitude: double.parse(list[i].longitude ?? '0.0')),
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/img/location_icon.png'),
                    scale: 1)));
          }),
          onTap: (ClusterizedPlacemarkCollection self, Point point) =>
              print('Tapped me at $point'),
        );
        setState(() {
          mapObjects.add(clusterizedPlacemarkCollection);
        });
      }
    }
  }

  Future<void> setCurrentLocation({double? zoom}) async {
    setState(() {
      valueHolder = zoom ?? 10;
    });
    final point = await getPoint();
    if (point != null) {
      await controller.moveCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(target: point, zoom: zoom ?? await 10)),
          animation: animation);
    }
  }

  Future<Uint8List> _buildClusterAppearance(Cluster cluster) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(200, 200);
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    const radius = 60.0;

    final textPainter = TextPainter(
        text: TextSpan(
            text: cluster.size.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 50)),
        textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final textOffset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);
    textPainter.paint(canvas, textOffset);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  Future<void> checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = LocationPermission.denied;

    // if (!serviceEnabled) {
    //   await CustomSimpleDialog.show(
    //     context,
    //     text: "Joylashuvni aniqlash uchun GPSni yoqing",
    //     onTapOk: () async {
    //       await GeolocatorPlatform.instance.openLocationSettings();
    //       Navigator.pop(context);
    //     },
    //   );
    // }
    //
    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   await CustomSimpleDialog.show(
    //     context,
    //     text: "Joylashuvni aniqlash uchun GPSga ruxsat berishingiz kerak",
    //     onTapOk: () async {
    //       await GeolocatorPlatform.instance.openAppSettings();
    //       Navigator.pop(context);
    //     },
    //   );
    permission = await Geolocator.requestPermission();
    // if (permission == LocationPermission.denied) {
    //   await CustomSimpleDialog.show(
    //     context,
    //     text: "Joylashuvni aniqlash uchun GPSga ruxsat berishingiz kerak",
    //     onTapOk: () async {
    //       await GeolocatorPlatform.instance.openAppSettings();
    //       Navigator.pop(context);
    //     },
    //   );
    // }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   await CustomSimpleDialog.show(
    //     context,
    //     text: "Joylashuvni aniqlash uchun GPSga ruxsat berishingiz kerak",
    //     onTapOk: () async {
    //       await GeolocatorPlatform.instance.openAppSettings();
    //     },
    //   );
    // }
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
}
// void loadMapObjects() {
//   print('\nOBJECTS IS WORKER :${widget.listWorkers}\n');
//   print('\nOBJECTS IS WORK :${widget.listWork}\n');
//   if (widget.isWorkers) {
//     if (widget.listWorkers.isNotEmpty) {
//       for (var element in widget.listWorkers) {
//         mapObjects.add(Placemark(
//           onTap: (placemark, point) {
//             controller.moveCamera(
//                 CameraUpdate.newCameraPosition(CameraPosition(target: point)),
//                 animation: animation);
//             MapDialog.show(context,
//                 name: element.fullName,
//                 image: element.profilePhotoPath,
//                 adress: 'Toshkent asd asda ',
//                 age: '123 yosh');
//           },
//           mapId: MapObjectId(element.userId.toString()),
//           point: Point(
//               latitude: double.parse(element.latitude),
//               longitude: double.parse(element.longitude)),
//           icon: PlacemarkIcon.single(PlacemarkIconStyle(
//               image: BitmapDescriptor.fromAssetImage(
//                   'assets/img/location_icon.png'),
//               scale: 1)),
//         ));
//       }
//     }
//   } else {
//     if (widget.listWork.isNotEmpty) {
//       for (var element in widget.listWork) {
//         mapObjects.add(Placemark(
//           onTap: (placemark, point) {
//             controller.moveCamera(
//                 CameraUpdate.newCameraPosition(CameraPosition(target: point)),
//                 animation: animation);
//             MapDialog.show(context,
//                 name: element.fullName,
//                 adress: 'Toshkent asd asda ',
//                 age: '123 yosh');
//           },
//           mapId: MapObjectId(element.id.toString()),
//           point: Point(
//               latitude: double.parse(element.latitude),
//               longitude: double.parse(element.longitude)),
//           icon: PlacemarkIcon.single(PlacemarkIconStyle(
//               image: BitmapDescriptor.fromAssetImage(
//                   'assets/img/location_icon.png'),
//               scale: 1)),
//         ));
//       }
//     }
//   }
// }

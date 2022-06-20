import 'package:avto_hamyon/widgets/place_body_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceItem extends StatefulWidget {
  const PlaceItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.time,
      required this.distance,
      required this.rating})
      : super(key: key);
  final String title;
  final String description;
  final String time;
  final String distance;
  final String rating;

  @override
  State<PlaceItem> createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300),
        upperBound: 0.5,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 10, bottom: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    child: Text(
                      widget.description,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xb31a1a1a),
                      ),
                    ),
                  )
                ],
              ),
              MaterialButton(
                  padding: EdgeInsets.zero,
                  height: 50,
                  onPressed: () {},
                  child: const Icon(
                    Icons.call,
                    size: 28,
                    color: Color(0xff166799),
                  ),
                  color: const Color(0x1a166799),
                  shape: const CircleBorder())
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),
          Visibility(visible: _expanded, child: const PlaceBody()),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_border,
                      size: 22,
                      color: Color(0xffffc107),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating,
                      style: GoogleFonts.roboto(fontSize: 14),
                    )
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location_fill,
                      size: 20,
                      color: Color(0xff166799),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.distance,
                      style: GoogleFonts.roboto(fontSize: 14),
                    )
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.time,
                      style: GoogleFonts.roboto(fontSize: 14),
                    )
                  ],
                ),
              ),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_expanded) {
                          _controller.reverse(from: 0.5);
                        } else {
                          _controller.forward(from: 0.0);
                        }
                        _expanded = !_expanded;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                      size: 28,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

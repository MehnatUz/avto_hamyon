import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Planthome extends StatefulWidget {
  const Planthome({Key? key}) : super(key: key);

  @override
  State<Planthome> createState() => _PlanthomeState();
}

class _PlanthomeState extends State<Planthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Image(
                    width: 80,
                    height: 80,
                    image: AssetImage(
                      'assets/img/plant.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  Text('Hey Urvashi'),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceBody extends StatelessWidget {
  const PlaceBody(
      {Key? key,
      required this.time,
      required this.phone,
      required this.address,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.image5})
      : super(key: key);
  final String time;
  final String phone;
  final String address;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address: ',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.55),
                      child: Text(
                        address,
                        maxLines: 2,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.bookmark_border_rounded,
                  size: 24,
                  color: Colors.grey,
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  'Hours: ',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  'Phone: ',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  phone,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.33,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      child: Image.network(
                        image2 ??
                            'https://image.shutterstock.com/image-photo/worker-washing-red-car-sponge-600w-1859193349.jpg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      flex: 1,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Flexible(
                            child: Image.network(
                              image3 ??
                                  'https://image.shutterstock.com/image-photo/worker-washing-red-car-sponge-600w-1859193349.jpg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            flex: 1,
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Image.network(
                                    image4 ??
                                        'https://image.shutterstock.com/image-photo/worker-washing-red-car-sponge-600w-1859193349.jpg',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  flex: 1,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  flex: 1,
                                  child: Image.network(
                                    image5 ??
                                        'https://image.shutterstock.com/image-photo/worker-washing-red-car-sponge-600w-1859193349.jpg',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Image.network(
                  image1 ??
                      'https://image.shutterstock.com/image-photo/backside-asian-toddler-girl-child-600w-2091212839.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

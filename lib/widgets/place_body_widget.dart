import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceBody extends StatelessWidget {
  const PlaceBody({Key? key}) : super(key: key);

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
                    Text(
                      'Toshkent Amir Temur 108',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
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
                  'Open 8am - Closes 9pm',
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
                  '+998 99 888 77 66',
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

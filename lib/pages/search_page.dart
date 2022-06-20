import 'package:avto_hamyon/widgets/item_register.dart';
import 'package:avto_hamyon/widgets/place_item_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> regions = [
    'Hammasi',
    'Toshkent viloyati',
    'Andijon',
    'Namangan',
    'Farg\'ona',
    'Sirdaryo',
    'Jizzax',
    'Samarqand',
    'Qashqadaryo',
    'Surxandaryo',
    'Buxoro',
    'Navoiy',
    'Xorazm',
    'Qoraqalpog\'iston respublikasi',
    'Toshkent shahri',
  ];
  bool innerItems = false;
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (innerItems == true) {
          setState(() {
            innerItems = false;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * 0.11,
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 29),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF1B76AD), Color(0xFF0F537E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 11, vertical: 13),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400, fontSize: 24)),
              ),
            ),
          ),
        ),
        body: isEmpty
            ? Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RegisterInputItem(
                          width: MediaQuery.of(context).size.width * 0.42,
                          icon: const ImageIcon(
                              AssetImage('assets/img/color.png')),
                          controller: TextEditingController(),
                          hintText: 'Color',
                        ),
                        RegisterInputItem(
                          width: MediaQuery.of(context).size.width * 0.42,
                          haseIcon: false,
                          controller: TextEditingController(),
                          hintText: 'YY/MM/DD',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Results',
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.height * 0.45,
                      child: Image.asset('assets/img/404.png'))
                ],
              )
            : !innerItems
                ? ListView.builder(
                    key: const PageStorageKey("WorkersPage"),
                    itemCount: regions.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => setState(() {
                          innerItems = true;
                        }),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        regions[i],
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        ' (808)',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                    color: Color(0x801a1a1a),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                  )
                : SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: Colors.yellow.shade100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20),
                              child: const Text('data'),
                            ),
                            Container(
                              color: Colors.yellow.shade100,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20),
                              child: const Text('data'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Text(
                            'Results',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          key: const PageStorageKey("WorkersPage"),
                          itemCount: regions.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => setState(() {
                                      innerItems = true;
                                    }),
                                child: PlaceItem());
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

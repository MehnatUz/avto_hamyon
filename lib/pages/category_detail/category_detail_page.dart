import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/pages/category_detail/bloc/category_bloc.dart';
import 'package:avto_hamyon/pages/create_page.dart';
import 'package:avto_hamyon/pages/map/on_map_tabbar_page.dart';
import 'package:avto_hamyon/pages/place_detail_page.dart';
import 'package:avto_hamyon/pages/search_page.dart';
import 'package:avto_hamyon/service/models/place_model.dart';
import 'package:avto_hamyon/widgets/place_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({Key? key, required this.id, required this.title})
      : super(key: key);
  final int id;
  final String title;

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  bool saved = false;
  CategoryBloc bloc = CategoryBloc();
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          print('STATE IS $state');
          if (state is CategoryInitial) {
            bloc.add(PageOpened(widget.id));
          }
          if (state is CategoryLoaded) {
            PlaceModel places = state.places;
            total = places.count;
            return Scaffold(
              backgroundColor: const Color(0xffE5E5E5),
              appBar: AppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                bottom: PreferredSize(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: TabBarItem(
                                icon: SizedBox(
                                  width: 21,
                                  height: 22,
                                  child: Image.asset(
                                    'assets/img/key.png',
                                    color: !saved
                                        ? const Color(0xff166799)
                                        : Colors.black,
                                  ),
                                ),
                                text: '$total всего',
                                onTap: () {
                                  setState(() {
                                    saved = false;
                                  });
                                },
                                style: GoogleFonts.openSans(
                                    color: !saved
                                        ? const Color(0xff166799)
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )),
                          Flexible(
                              flex: 1,
                              child: TabBarItem(
                                  style: GoogleFonts.openSans(
                                      color: saved
                                          ? const Color(0xff166799)
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  icon: Icon(
                                    Icons.bookmark_border_rounded,
                                    color: saved
                                        ? const Color(0xff166799)
                                        : Colors.black,
                                  ),
                                  text: '0 лучших',
                                  onTap: () {
                                    setState(() {
                                      saved = true;
                                    });
                                  }))
                        ],
                      ),
                      height: 55.0,
                    ),
                    preferredSize: const Size.fromHeight(55.0)),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (_) => const SearchPage()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 36,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
                elevation: 0,
                centerTitle: true,
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(
                    Icons.menu_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white,
                title: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    child: const Icon(
                      Icons.add,
                      size: 28,
                    ),
                    backgroundColor: Colors.blue.shade900,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (_) => const CreatePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  // FloatingActionButton(
                  //   child: const Icon(
                  //     Icons.location_on,
                  //     size: 28,
                  //   ),
                  //   backgroundColor: Colors.green.shade700,
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       CupertinoPageRoute(
                  //         builder: (context) {
                  //           return const OnMapTabBarPage();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
              body: ListView.builder(
                itemCount: places.count,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, i) {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: i == 0 ? 4 : 8, bottom: i == 6 ? 4 : 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) =>
                                    PlacePage(place: places.results[i])),
                          );
                        },
                        child: PlaceItem(
                          distance: places.results[i].addressTitle,
                          title: places.results[i].title,
                          rating: '',
                          description: places.results[i].description,
                          time: places.results[i].mondayFrom +
                              ' : ' +
                              places.results[i].toMonday,
                          image5: places.results[i].image4,
                          image4: places.results[i].image3,
                          image3: places.results[i].image2,
                          image2: places.results[i].image4,
                          image1: places.results[i].image1,
                          phone: places.results[i].phoneNumber,
                        ),
                      ));
                },
              ),
            );
          }
          return Scaffold(
              backgroundColor: const Color(0xffE5E5E5),
              appBar: AppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                bottom: PreferredSize(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: TabBarItem(
                                icon: SizedBox(
                                  width: 21,
                                  height: 22,
                                  child: Image.asset(
                                    'assets/img/key.png',
                                    color: !saved
                                        ? const Color(0xff166799)
                                        : Colors.black,
                                  ),
                                ),
                                text: '$total всего',
                                onTap: () {
                                  setState(() {
                                    saved = false;
                                  });
                                },
                                style: GoogleFonts.openSans(
                                    color: !saved
                                        ? const Color(0xff166799)
                                        : Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )),
                          Flexible(
                              flex: 1,
                              child: TabBarItem(
                                  style: GoogleFonts.openSans(
                                      color: saved
                                          ? const Color(0xff166799)
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  icon: Icon(
                                    Icons.bookmark_border_rounded,
                                    color: saved
                                        ? const Color(0xff166799)
                                        : Colors.black,
                                  ),
                                  text: '0 лучших',
                                  onTap: () {
                                    setState(() {
                                      saved = true;
                                    });
                                  }))
                        ],
                      ),
                      height: 55.0,
                    ),
                    preferredSize: const Size.fromHeight(55.0)),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (_) => const SearchPage()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: Icon(
                        CupertinoIcons.search,
                        size: 36,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
                elevation: 0,
                centerTitle: true,
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(
                    Icons.menu_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white,
                title: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
                ),
              ),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    child: const Icon(
                      Icons.add,
                      size: 28,
                    ),
                    backgroundColor: Colors.blue.shade900,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (_) => const CreatePage()),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  FloatingActionButton(
                    child: const Icon(
                      Icons.location_on,
                      size: 28,
                    ),
                    backgroundColor: Colors.green.shade700,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return const OnMapTabBarPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: const Center(child: CircularProgressIndicator()));
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) {},
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'главная'),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.location), label: 'сервисы'),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.compass), label: 'поиск'),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.settings), label: 'настройки'),
      //   ],
      // ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.style,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final TextStyle style;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.transparent,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 6),
            Text(
              text,
              style: style,
            )
          ],
        ),
      ),
    );
  }
}

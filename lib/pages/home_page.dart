import 'package:avto_hamyon/asset.dart';
import 'package:avto_hamyon/const.dart';
import 'package:avto_hamyon/pages/category_detail_page.dart';
import 'package:avto_hamyon/pages/my_cars_page.dart';
import 'package:avto_hamyon/pages/place_detail_page.dart';
import 'package:avto_hamyon/pages/search_page.dart';
import 'package:avto_hamyon/widgets/category_item.dart';
import 'package:avto_hamyon/widgets/simple_button.dart';
import 'package:avto_hamyon/widgets/sub_category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
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
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            print('PRESSED HERE');
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => const MyCarsPage(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Категории',
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GridView.count(
                padding: EdgeInsets.zero,
                childAspectRatio: 1.2,
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                // mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: List.generate(placesCategories.count, (index) {
                  return CategoryItem(
                    title: placesCategories.results[index].title!,
                    image: placesCategories.results[index].image ??
                        'https://images.unsplash.com/photo-1566580687125-668d1d8d5489?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const CategoryDetailPage()),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Недавные сервисы',
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          left: i == 0 ? 0 : 8,
                          right: i == 6 ? 0 : 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (_) =>
                                    PlacePage(place: places.results[i])),
                          );
                        },
                        child: SubCategoryItem(
                          title: places.results[i].title,
                          icon: const Icon(
                            CupertinoIcons.car_detailed,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              SimpleButton(
                icon: const Icon(Icons.call, color: Colors.white, size: 23),
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                text: 'Помощь при дтп',
                onTap: () {
                  launch("tel://911");
                },
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffFB7618), Color(0xffEF490D)],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

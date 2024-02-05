import 'package:bhagavd_gita/controller/theme_provider.dart';
import 'package:bhagavd_gita/utils/util.dart';
import 'package:bhagavd_gita/view/firstpage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width); // Corrected MediaQuery usage
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text("Bhagavad Gita"),
        centerTitle: true,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, tp, child) {
              return Switch(
                value: tp.isTheme,
                onChanged: (value) {
                  tp.setTheme(value);
                },
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: cImage.length,
            itemBuilder: (context, index, realIndex) {
              var ci = cImage[index];
              return Container(
                clipBehavior: Clip.antiAlias,
                height: 250,
                width: MediaQuery.of(context).size.width, // Corrected MediaQuery usage
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  ci,
                  fit: BoxFit.fill,
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              clipBehavior: Clip.antiAlias,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              height: 300,
              enlargeFactor: 0.2,
              viewportFraction: 0.9,
              pauseAutoPlayOnTouch: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FirstPage(),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bhagavd_gita/controller/chapters_provider.dart';
import 'package:bhagavd_gita/view/slokpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/all_chapters_model.dart';

class SecondPage extends StatefulWidget {
  final int chapterNumber;
  final String? chapter_summary;
  final String? name;
  final String? json_path;
  final String? name_translation;
  final List<Verse>? verses;

  SecondPage({
    Key? key,
    required this.chapterNumber,
    this.name,
    this.chapter_summary,
    this.json_path,
    this.name_translation,
    this.verses,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    var p = Provider.of<ChaptersProvider>(context, listen: false);
    p.getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name_translation ?? ""),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ChaptersProvider>(
          builder: (context, chppro, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.grey,
                    child: Image.asset(
                      "assets/images/s1.webp",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      widget.name ?? "",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8, end: 20, start: 20),
                  child: Text(
                    "${widget.chapter_summary}",
                    maxLines: (chppro.showMore == true) ? null : 4,
                    overflow: (chppro.showMore == true)
                        ? null
                        : TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (chppro.showMore == false) {
                          chppro.showmore();
                        } else {
                          chppro.showless();
                        }
                      },
                      child: Container(
                        margin: EdgeInsetsDirectional.only(top: 8, end: 20, start: 20),
                        child: (chppro.showMore == false)
                            ? Text("SHOW MORE", style: TextStyle(color: Colors.grey))
                            : Text("SHOW LESS", style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SlokPage(
                            verses: widget.verses ?? [],
                            name_translation: widget.name_translation,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      height: MediaQuery.of(context).size.height * 0.070,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "All Verses",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

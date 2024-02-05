import 'package:bhagavd_gita/controller/chapters_provider.dart';
import 'package:bhagavd_gita/view/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key); // Corrected super call

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var p = Provider.of<ChaptersProvider>(context, listen: false);
    p.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ChaptersProvider>(
        builder: (context, chp, child) {
          return chp.chlist.isNotEmpty
              ? ListView.builder(
            itemCount: chp.chlist.length,
            itemBuilder: (context, index) {
              var chapterslist = chp.chlist[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    child: Text(
                      chapterslist.chapterNumber.toString(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.090, // Corrected MediaQuery usage
                    width: MediaQuery.of(context).size.width * 0.7, // Corrected MediaQuery usage
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: ListTile(
                      title: Text(
                        chapterslist.name ?? "",
                        style: TextStyle(fontSize: 23),
                      ),
                      subtitle: Text("Verses: ${chapterslist.versesCount ?? 0}"), // Ensure to handle null values
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                              chapterNumber: chapterslist.chapterNumber!,
                              chapter_summary: chapterslist.chapterSummary,
                              json_path: chapterslist.jsonPath,
                              name: chapterslist.name,
                              name_translation: chapterslist.nameTranslation,
                              verses: chapterslist.verses,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

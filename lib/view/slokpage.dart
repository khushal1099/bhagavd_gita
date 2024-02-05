import 'package:bhagavd_gita/controller/chapters_provider.dart';
import 'package:bhagavd_gita/model/all_chapters_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SlokPage extends StatefulWidget {
  final List<Verse> verses;
  final String? name_translation;

  SlokPage({
    Key? key,
    required this.verses,
    this.name_translation,
  }) : super(key: key);

  @override
  State<SlokPage> createState() => _SlokPageState();
}

class _SlokPageState extends State<SlokPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name_translation ?? ""),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Consumer<ChaptersProvider>(
            builder: (context, value, child) {
              final toggleIndex = value.toggleIndex ?? 0; // Default to 0 if toggleIndex is null
              return ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20,
                labels: ['English', 'Gujrati', 'Sanskrit', 'Hindi'],
                initialLabelIndex: toggleIndex,
                onToggle: (val) {
                  Provider.of<ChaptersProvider>(context, listen: false).setToogleIndex(val);
                },
              );
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: Consumer<ChaptersProvider>(
              builder: (context, value, child) {
                final toggleIndex = value.toggleIndex ?? 0; // Default to 0 if toggleIndex is null
                return ListView.builder(
                  itemCount: widget.verses.length,
                  itemBuilder: (context, index) {
                    final sample = widget.verses[index];
                    String title = '';
                    switch (toggleIndex) {
                      case 0:
                        title = sample.en ?? "";
                        break;
                      case 1:
                        title = sample.guj ?? "";
                        break;
                      case 2:
                        title = sample.san ?? "";
                        break;
                      case 3:
                        title = sample.hi ?? "";
                        break;
                    }
                    return Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          child: Text("${widget.verses[index].verse}"),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(title),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

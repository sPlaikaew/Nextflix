import 'package:flutter/material.dart';
import 'package:nextflix/utils/themes/color.dart';

class TabView extends StatefulWidget {
  final Map<String, Widget> contentScreen;
  const TabView({super.key, required this.contentScreen});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    var keys = widget.contentScreen.keys.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 0.5,
          color: Colors.white,
        ),
        Row(
          children: List.generate(
            widget.contentScreen.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    select = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 5,
                              color: select == index
                                  ? NextFlixColor.primary
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            keys[index],
                            style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 17),
        for (int i = 0; i < widget.contentScreen.length; i++)
          i == select ? widget.contentScreen[keys[i]]! : Container(),
      ],
    );
  }
}

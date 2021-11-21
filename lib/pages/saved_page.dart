import 'package:flutter/material.dart';
import 'package:social_ui_kit/data/post_json.dart';
import 'package:social_ui_kit/theme/colors.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(0)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Saved",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(postsList.length, (index) {
                return Container(
                  width: (size.width - 70) / 2,
                  height: (size.width - 70) / 2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(postsList[index]['postImg']),
                          fit: BoxFit.cover)),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

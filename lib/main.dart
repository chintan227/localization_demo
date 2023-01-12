import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Localization',
      translations: LocaleString(),
      locale: const Locale("en_US"),
      home: const MyHomePage(title: 'Localization'),
    );
  }
}

final List locale = [
  {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
  {'name': '中文', 'locale': const Locale('zh', 'CN')},
];

updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Change Password'.tr,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          buildLanguageDialog(context);
        },
        tooltip: 'Change Language',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


buildLanguageDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text(
            'Choose Your Language'.tr,
            style: const TextStyle(
                fontSize:16,
                fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height:  80,
            width:200,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(
                        locale[index]['name'],
                      ),
                      onTap: () {
                        updateLanguage(locale[index]['locale']);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.blueAccent,
                  );
                },
                itemCount: locale.length),
          ),
        );
      });
}
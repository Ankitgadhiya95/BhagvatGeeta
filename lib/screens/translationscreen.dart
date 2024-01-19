import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json/screens/slocksscreen.dart';
import 'package:provider/provider.dart';
import '../jsonmodel.dart';
import '../themeprovider.dart';

enum Language { eng, guj }

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  var jsonData;
  bool isLoading = false;

  JsonModel? jm;
  Language? selectedMenu;

  @override
  void initState() {
    final darkTheme = Provider.of<ThemeProvider>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    // TODO: implement initState

    darkTheme.loadJsonData('english').then((value) {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor!, //Color(0xFFE7A611),
      appBar: AppBar(
          backgroundColor: Theme.of(context)
              .appBarTheme
              .backgroundColor, // Color(0XFFF5A623),
          title: Text(
            "श्रीमद् भगवद्गीता",
            style: TextStyle(
              color: Theme.of(context).appBarTheme.titleTextStyle!.color,
            ),
          ),
          actions: [
            Row(
              children: [
                Switch(
                  value: darkTheme.theme,
                  onChanged: (value) {
                    darkTheme.setDarkTheme = value;
                  },
                ),
                PopupMenuButton<Language>(
                  iconColor: Theme.of(context).appBarTheme.iconTheme!.color,
                  initialValue: selectedMenu,
                  onSelected: (Language item) {
                    setState(() {
                      selectedMenu = item;
                    });
                    if (selectedMenu == Language.eng) {
                      darkTheme.loadJsonData('english');
                    } else {
                      darkTheme. loadJsonData('gujrati');
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Language>>[
                    const PopupMenuItem<Language>(
                      value: Language.eng,
                      child: Text('English'),
                    ),
                    const PopupMenuItem<Language>(
                      value: Language.guj,
                      child: Text('Gujarati'),
                    ),
                  ],
                ),
              ],
            ),
          ]),
      body: Center(
        child: (isLoading == true)
            ? CircularProgressIndicator()
            : ListView.separated(
                itemCount: darkTheme.jsonList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SlockScreen(
                            slockList: darkTheme.jsonList[index].slocksList!,
                            adhyayList: darkTheme.jsonList,
                            index: index,
                          ),
                        ),
                      );
                    },
                    title: Text(
                      darkTheme.jsonList[index].translation.toString()!,
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle!.color,
                      ),
                    ),
                    leading: Text(
                      darkTheme.jsonList[index].chapter_number.toString()!,
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle!.color,
                      ),
                    ),
                    trailing: Text(
                      darkTheme.jsonList[index].verses_count.toString()!,
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle!.color,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                  );
                },
              ),
      ),
    );
  }


}

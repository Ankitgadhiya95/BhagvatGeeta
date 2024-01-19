import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String slok_name;
  final String meaning;
  final String summary;

  const DetailScreen(
      {super.key,
      required this.image,
      required this.slok_name,
      required this.meaning,
      required this.summary});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor!,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.slok_name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Theme.of(context).appBarTheme.titleTextStyle!.color),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Meaning:-',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                ),
              ),
              Text(
                widget.meaning,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Summary:-',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                ),
              ),
              Text(
                widget.summary,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

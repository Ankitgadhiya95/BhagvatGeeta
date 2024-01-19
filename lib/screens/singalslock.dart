import 'package:flutter/material.dart';
import '../jsonmodel.dart';
import 'detailscrees.dart';

class SingalSlock extends StatefulWidget {
  final List<SlocksModel> slockList;

  const SingalSlock({super.key, required this.slockList});

  @override
  State<SingalSlock> createState() => _SingalSlockState();
}

class _SingalSlockState extends State<SingalSlock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor!,
        body: ListView.builder(
          itemCount: widget.slockList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        image: widget.slockList[index].shlok_img!,
                        slok_name: widget.slockList[index].shlok_name!,
                        meaning: widget.slockList[index].meaning!,
                        summary: widget.slockList[index].summary!,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle!
                              .color!),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.slockList[index].shlok_name!,
                      style: TextStyle(
                          color: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle!
                              .color,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
            );
          },
        )

        /*ListView.builder(
            itemCount: widget.slockList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(image: widget.slockList[index].shlok_img!, slok_name: widget.slockList[index].shlok_name!, meaning: widget.slockList[index].meaning!, summary: widget.slockList[index].summary!,

                        //  slockList: jsonList[index].slocksList!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.red,
                    child: Center(child: Text(widget.slockList[index].shlok_name!)),
                  ),
                ),
              );

            },
          )*/
        );
  }
}

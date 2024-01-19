import 'package:flutter/material.dart';
import 'package:json/screens/singalslock.dart';
import '../jsonmodel.dart';

class SlockScreen extends StatefulWidget {
  final List<SlocksModel> slockList;
  final List<JsonModel> adhyayList;
  final int index;

  const SlockScreen(
      {super.key,
      required this.slockList,
      required this.adhyayList,
      required this.index});

  @override
  State<SlockScreen> createState() => _SlockScreenState();
}

class _SlockScreenState extends State<SlockScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = [];
  int index = 0;
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController =
        new TabController(vsync: this, length: widget.adhyayList.length);
    _tabController!.animateTo((widget.index));
    index = widget.index;
    super.initState();
    for (int i = 0; i < widget.adhyayList.length; i++) {
      setState(() {
        tabs.add(Tab(
          child: Text(
            "अध्याय :- " + widget.adhyayList[i].chapter_number!.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.adhyayList.length,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Theme.of(context).indicatorColor,
              controller: _tabController,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              isScrollable: true,
              tabs: tabs,
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(
              widget.adhyayList[index].translation!,
            ),
            automaticallyImplyLeading: false,
          ),
          body: TabBarView(children: [
            SingalSlock(
              slockList: widget.adhyayList[index].slocksList!,
            )
          ])

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
          ),
    );
  }
}

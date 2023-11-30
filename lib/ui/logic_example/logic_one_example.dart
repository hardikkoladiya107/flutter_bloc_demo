import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/other/cmn_ext.dart';

class LogicOneExample extends StatefulWidget {
  LogicOneExample({Key? key}) : super(key: key);

  @override
  State<LogicOneExample> createState() => _LogicOneExampleState();
}

class _LogicOneExampleState extends State<LogicOneExample> {
  int maxItem = 20;

  var itemList = List<int>.generate(20, (i) => i + 1);

  List<int> childrenList = [];

  int selectedIndex = 0;

  @override
  void initState() {
    moveItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boxWidgets(),
            forwardBackWardButton(),
          ],
        ),
      ).safeArea,
    );
  }

  Widget boxWidgets() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: childrenList.length,
        itemBuilder: (BuildContext context, int index) {
          return boxItem(childrenList[index].toString());
        },
      ),
    );
  }

  Widget boxItem(String item) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      width: 50,
      color: Colors.pink,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ).center,
    );
  }

  Widget forwardBackWardButton() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedIndex = (selectedIndex - 4) % itemList.length;
            });
            moveItems();
          },
          child: const Text("Backward"),
        ),
        const Spacer(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedIndex = (selectedIndex + 4) % itemList.length;
              });
              moveItems();
            },
            child: const Text("Forward"),
          )
      ],
    ).padding(all: 10);
  }

  void moveItems() {
    childrenList.clear();
    int start = selectedIndex;
    int end = (selectedIndex+4) % itemList.length;

    if(end<start){
      childrenList.addAll(itemList.sublist(start, itemList.length));
      childrenList.addAll(itemList.sublist(0,end));
    }else{
      childrenList.addAll(
          itemList.sublist(start, end)
      );
    }
  }
}

//4 % 18 = 4
//18 % 4 = 2
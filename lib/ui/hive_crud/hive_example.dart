import 'package:flutter/material.dart';

import '../../db/hive_helper.dart';
import '../../models/cat_model.dart';

class HiveExample extends StatefulWidget {
  const HiveExample({Key? key}) : super(key: key);

  @override
  State<HiveExample> createState() => _HiveExampleState();
}

class _HiveExampleState extends State<HiveExample> {
  @override
  Widget build(BuildContext context) {
    var catList = (hiveHelper.getCat());

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                hiveHelper.addCat(const CatModel("name", "age", true));
                setState(() {});
              },
              child: const Text("CLick"),
            ),
            (catList ?? []).isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: catList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return catCard(catList?[index]);
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  catCard(CatModel? catModel) {
    return Container(
      child: Row(
        children: [
          Text(catModel?.name ?? ""),
          Text(catModel?.age ?? ""),
        ],
      ),
    );
  }
}

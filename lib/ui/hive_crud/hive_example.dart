import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/other/cmn_ext.dart';

import '../../db/hive_helper.dart';
import '../../models/cat_model.dart';

class HiveExample extends StatefulWidget {
  const HiveExample({Key? key}) : super(key: key);

  @override
  State<HiveExample> createState() => _HiveExampleState();
}

class _HiveExampleState extends State<HiveExample> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool isChecked = false;

  int? updateIndex;

  @override
  Widget build(BuildContext context) {
    var catList = (hiveHelper.getCat());

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hive Crud"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              catNameTextField(),
              carAgeTextField(),
              genderCheckBox(),
              addButton(),
              catItemsList(catList),
            ],
          ),
        ),
      ),
    );
  }

  Widget catItemsList(List<CatModel>? catList) {
    return (catList ?? []).isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: catList?.length ?? 0,
              itemBuilder: (context, index) {
                return catCard(catList?[index], index);
              },
            ),
          )
        : Container();
  }

  Widget genderCheckBox() {
    return Row(
      children: [
        Switch(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = !isChecked;
            });
          },
        ),
        const Text("Cat is Male??")
      ],
    ).padding(all: 10);
  }

  Widget catNameTextField() {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        hintText: "Enter Name",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ).padding(all: 10);
  }

  Widget carAgeTextField() {
    return TextField(
      controller: ageController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        hintText: "Enter Age",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ).padding(all: 10);
  }

  Widget addButton() {
    return ElevatedButton(
      onPressed: () {
        if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
          if (updateIndex != null) {
            hiveHelper.updateCat(
                CatModel(nameController.text, ageController.text, isChecked),
                updateIndex!);
          } else {
            hiveHelper.addCat(
              CatModel(nameController.text, ageController.text, isChecked),
            );
          }
          nameController.clear();
          ageController.clear();
          isChecked = false;
          updateIndex = null;
          setState(() {});
        }
      },
      child: Text(updateIndex != null ? "Update" : "Submit"),
    );
  }

  catCard(CatModel? catModel, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Cat Name : -",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(catModel?.name ?? ""),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Cat Age : -",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(catModel?.age ?? ""),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Gender : -",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text((catModel?.isMale ?? false) ? "Male" : "Female"),
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              const Icon(
                Icons.edit,
                color: Colors.blue,
              ).onClick(() {
                CatModel? model = hiveHelper.getCatFromIndex(index);
                if (model != null) {
                  nameController.text = model.name;
                  ageController.text = model.age;
                  isChecked = model.isMale;
                  updateIndex = index;
                }
                setState(() {});
              }),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.delete,
                color: Colors.red,
              ).onClick(() {
                hiveHelper.deleteCat(index);
                setState(() {});
              })
            ],
          )
        ],
      ).padding(all: 10),
    );
  }
}

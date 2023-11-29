import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/cat_model.dart';

final hiveHelper = HiveHelper();

///flutter packages pub run build_runner build <------for generate adapter class
///https://medium.com/gytworkz/hive-database-in-flutter-store-and-retrieve-data-locally-d53b333d74ee
class HiveHelper {
  HiveHelper? _hiveHelper;
  Box<CatModel>? catBox;

  init() async {
    _hiveHelper ??= HiveHelper();
    await Hive.openBox<CatModel>('cats');
    catBox = Hive.box<CatModel>('cats');
    catBox?.listenable();
  }

  addCat(CatModel model){
    //var model = const CatModel("name", "age", true);
    catBox?.add(model);//save by index in increment order
    //catBox?.put(model.name,model);// save by key value pair
  }


  List<CatModel>? getCat(){
    // catBox?.get('name'); // get by key value pair
    // catBox?.getAt(0); // get by index
    return catBox?.values.toList(); // get list of data from here
  }

  CatModel? getCatFromIndex(int index){
    return catBox?.getAt(index);
  }


  updateCat(CatModel model,int index){
    // var model = const CatModel("new name", "new age", true);
    // catBox?.put("name", model);// update model by using key
    catBox?.putAt(index, model);// update model by using key
  }

  deleteCat(int index){
   //catBox?.delete("name");
    catBox?.deleteAt(index);
    //catBox?.deleteAll([]);
  }
}


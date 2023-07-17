import 'package:hive/hive.dart';

class DB {
  static late Box box;

  setData(int data){
    box.put('name', data);
  }
   int getData(){
    int n = box.get('name')==null?0:box.get("name");
    return n;
  }


}

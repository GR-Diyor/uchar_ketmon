import 'package:hive/hive.dart';

class DB {
  var box = Hive.openBox('myBox');
  //
  // setData(int data){
  //   box.put('name', data);
  // }
  // Object getData(){
  //   Object n = box.get('name')==null?0:box.get("name");
  //   return n;
  // }


}

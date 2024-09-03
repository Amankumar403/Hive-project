
import 'package:hive/hive.dart';

var dataBox = Hive.box("MyData");

createdata(data)async{
  await dataBox.add(data);
  print(dataBox.length);
}
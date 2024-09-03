import 'package:flutter/material.dart';
import 'package:hive_new_project/add_page.dart';

import 'modal.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    remindData();
    super.initState();
  }
  List mydata = [];

  remindData (){
    var data = dataBox.keys.map((key) {
      final itam = dataBox.get(key);
      return {"key" :key, "name" : itam["name"],"date" : itam["date"] };
    }).toList();
    setState(() {
      mydata = data.reversed.toList();
    });
  }

  deletsaveData(Data)async{
    await dataBox.delete(Data);
    remindData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hive New Project'),
      ),

      //body
      body: Container(
        height: double.infinity,width: double.infinity,
        child: ListView.builder(
          itemCount: mydata.length,
          itemBuilder: (context , index){
            var currentdata = mydata[index];
            return Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                title: Text(currentdata["name"]),
                subtitle: Text(currentdata["date"]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 40,width: 0.5,
                    ),
                    IconButton(
                      onPressed: (){
                        deletsaveData(mydata[index]["key"]);
                      },
                      icon: Icon(Icons.delete_forever_outlined,size: 30,color: Colors.red.shade300,),
                    ),
                  ],
                )
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
          },
          label: Text("+",style: TextStyle(fontSize: 40,),)
      ),
    );
  }
}

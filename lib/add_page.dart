import 'package:flutter/material.dart';
import 'package:hive_new_project/hame_page.dart';
import 'modal.dart';


class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data',),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date ',
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(nameController.text.isNotEmpty && dateController.text.isNotEmpty){
                  taskdata();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }else if (nameController.text.isEmpty || dateController.text.isEmpty){
                  print("null");
                }
              },
              child: Text('Save',),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  savePage(){
  }
  taskdata(){
    var Data = {
      "name" : nameController.text,
      "date" : dateController.text
    };createdata(Data);
  }
}

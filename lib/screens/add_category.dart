import 'package:flutter/material.dart';
import 'package:rest_sent/constant.dart';

class AddCategory extends StatefulWidget {
  static const id = 'AddCategory';
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final AddCategoyr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xFFD32F2F),
  centerTitle: true,
  title: Text('Add category',
    style: TextStyle(
        color: Colors.white,
        fontSize: 20.0
    ),),

),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              width: MediaQuery.of(context).size.width*.7,
              child: TextField(
                textAlign: TextAlign.center,
                controller: AddCategoyr,
                decoration: KTextDecoration.copyWith(
                    hintText: 'Enter your category'),

              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF44336),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width * 0.045,
                          color: Colors.white),
                    ),
                    onPressed: (){
                      setState(() {
                        cate.add(AddCategoyr.text);
                        AddCategoyr.clear();
                      });
                    }, // مطعم
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF44336),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width * 0.045,
                          color: Colors.white),
                    ),
                    onPressed: (){
                      setState(() {
                        cate.remove(AddCategoyr.text);
                        AddCategoyr.clear();
                      });
                    }, // مطعم
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              width: MediaQuery.of(context).size.width*.5,
              child: DropdownButton(
                hint: Text('select catefory'),
                value: dataDrop,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    dataDrop = value;
                  });
                },
                items: cate.map((e) {
                  return DropdownMenuItem(child: Text(e), value: e);
                }).toList(),
                dropdownColor: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

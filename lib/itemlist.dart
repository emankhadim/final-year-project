import 'package:arcore_flutter_plugin_example/ARViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin_example/item_model.dart';
class ItemScreen extends StatelessWidget {
  List<ItemModel> items = [
    ItemModel(price: 12,name: 'Double bed',detail: 'Double bed with 2 lamps', pic: 'items/ch.png'),
    ItemModel(price: 10,name: 'Single Sofa',detail: 'White sofa for your home', pic: 'items/sofa_white.png'),
    ItemModel(price: 2,name: 'Double Sofa',detail: 'Three Seater branded sofa', pic: 'items/sofa_yellow.png'),
    ItemModel(price: 12,name: 'Chair Brown',detail: 'A small chair', pic: 'items/pc_table.png'),
    ItemModel(price: 12,name: 'Dinning table',detail: 'famile time', pic: 'items/dinner_table.png'),
    ItemModel(price: 12,name: 'PC table',detail: 'Gaming table', pic: 'items/pc_table2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.all(26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("PakAR"),
                ],
              )
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                
              )
            ),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ArViewScreeen(img: items[index].pic,)));
                    },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80, height: 80,
                            child: Image.asset("${items[index].pic}", width: 60),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(items[index].name, style: TextStyle(color: Colors.black)),
                                Text(items[index].detail, style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          )

                        ],
                      ),
                  );
                },
                separatorBuilder: (BuildContext context, int index)=>Divider(),
                itemCount: items.length),
          )
        )
      )
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';

import 'Lists/Lists.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: carKm.length == null ? 0 : carKm.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(right: 10,left: 10),
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.width / 3,
                        image: AssetImage(
                            'assets/images/${carMark[index]}/${carModel[index]}'),
                      ),
                      Row(
                        children: [
                          Text(
                            '${carMark[index]}',
                            style:
                                TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          forpng(index),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${carKm[index]} km, ',
                            style: TextStyle(color: Colors.grey, fontSize: 25),
                          ),
                          Text(
                            '${carYear[index]} model',
                            style: TextStyle(color: Colors.grey, fontSize: 25),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Description: ${carDesc[index]}',
                            style: TextStyle(color: Colors.grey, fontSize: 25),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Price :${carPrice[index]} TL',
                            style: TextStyle(color: Colors.green, fontSize: 32),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 2.5,color: Colors.grey,)
              ],
            ),
          );
        });
  }

  Widget forpng(int index) {
    int lng = carModel[index].length;
    String txt = carModel[index];
    String newTxt = txt.substring(0, lng - 4);
    return Text(
      newTxt,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

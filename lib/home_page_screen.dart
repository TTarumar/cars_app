import 'package:flutter/material.dart';
import 'package:homework_app/list_screen.dart';

import 'Lists/Lists.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController kmCont = TextEditingController();
  TextEditingController yearCont = TextEditingController();
  TextEditingController priceCont = TextEditingController();
  TextEditingController descCont = TextEditingController();

  var curCar;
  var curMod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: Center(child: Text("New Car")),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: DropdownButton<String>(
                                hint: Text("Marker"),
                                onChanged: (newValue) {
                                  setState(() {
                                    curCar = newValue;
                                  });
                                },
                                items: <String>[
                                  'BMW',
                                  'Honda',
                                  'Mercedes'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onTap: () {
                                  curMod = null;
                                },
                                value: curCar,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: DropdownButton<String>(
                                hint: Text("Model"),
                                onChanged: (newValue) {
                                  setState(() {
                                    curMod = newValue;
                                  });
                                },
                                items: curCar == "BMW"
                                    ? <String>[
                                        "3-series.png",
                                        "7-series.png",
                                        "X1.png",
                                        "X2.png",
                                        "X3.png"
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()
                                    : curCar == "Honda"
                                        ? <String>[
                                            "Civic.png",
                                            "CR-V.png",
                                            "Jazz.png"
                                          ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList()
                                        : curCar == "Mercedes"
                                            ? <String>[
                                                "A-class.png",
                                                "E-class.png",
                                                "G-class.png",
                                                "Maybach.png"
                                              ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList()
                                            : null,
                                value: curMod,
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "Kilometer"),
                              controller: kmCont,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "Year"),
                              controller: yearCont,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "Price"),
                              controller: priceCont,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: "Description"),
                              controller: descCont,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            curCar = null;
                            curMod = null;
                            kmCont.text="";
                            yearCont.text="";
                            priceCont.text="";
                            descCont.text="";
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            if (kmCont.text == "" ||
                                yearCont.text == "" ||
                                priceCont.text == "" ||
                                descCont.text == "" ||
                                curCar == null ||
                                curMod == null) {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("No text can be empty"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Okay"))
                                      ],
                                    );
                                  });
                            } else {
                              this.setStater();
                              kmCont.text = "";
                              yearCont.text = "";
                              priceCont.text = "";
                              descCont.text = "";
                              curCar = null;
                              curMod = null;
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text("Add"),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
        appBar: AppBar(
          title: Text("Cars"),
          centerTitle: true,
        ),
        body: ListScreen());
  }

  void setStater() {
    setState(() {
      carMark.add(curCar);
      carModel.add(curMod);
      carKm.add(kmCont.text);
      carYear.add(yearCont.text);
      carPrice.add(priceCont.text);
      carDesc.add(descCont.text);
    });
  }
}

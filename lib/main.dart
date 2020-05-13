import 'package:flutter/material.dart';

void main() {
  runApp(NamesApp());
}

class NamesApp extends StatefulWidget {
  @override
  _NamesAppState createState() => _NamesAppState();
}

class _NamesAppState extends State<NamesApp> {
  TextEditingController name = TextEditingController();
  TextEditingController rno = TextEditingController();
  TextEditingController admno = TextEditingController();
  TextEditingController college = TextEditingController();
  var namelist = [];
  var rnolist = [];
  var admnolist = [];
  var collegelist = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 75.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: name,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Roll No:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: rno,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Admission Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: admno,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter College Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: college,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    var myName = name.text;
                    var myRno = rno.text;
                    var myAdmno = admno.text;
                    var myCollege = college.text;
                    name.clear();
                    rno.clear();
                    admno.clear();
                    college.clear();
                    setState(() {
                      namelist.add(myName);
                      rnolist.add(myRno);
                      admnolist.add(myAdmno);
                      collegelist.add(myCollege);
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: namelist.length == null ? 0 : namelist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.perm_identity,color: Colors.blue,),
                          trailing: GestureDetector(
                              onTap: (){
                                setState(() {
                                  namelist.removeAt(index);
                                  rnolist.removeAt(index);
                                  admnolist.removeAt(index);
                                  collegelist.removeAt(index);

                                });
                              },
                              child: Icon(Icons.clear,color: Colors.red,)),
                          title: Text("Name: " +
                              namelist[index] +
                              "\nRoll No: " +
                              rnolist[index] +
                              "\nAdmission Number: " +
                              admnolist[index] +
                              "\nCollege: " +
                              collegelist[index]),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

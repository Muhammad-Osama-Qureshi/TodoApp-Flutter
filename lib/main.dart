import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";
  List<dynamic> lst = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.amberAccent,
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text("${lst[index]}"),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Edit Item"),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Edit"))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            onTap: () {
                              lst.removeAt(index);
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Add Item"),
                      content: TextField(
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                                lst.add(output);
                              });
                            },
                            child: Text("Add"))
                      ],
                    );
                  });
              ;
            },
            child: Text(
              "+",
              style: TextStyle(fontSize: 30),
            )));
  }
}

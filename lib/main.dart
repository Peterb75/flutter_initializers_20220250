import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widgets'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Inicio',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.headphones),
                      label: 'Otra pestaña',
                    ),
                  ],
                  currentIndex: 0,
                  onTap: (index) {},
                ),
                DataTable(
                  columns: [
                    DataColumn(label: Text("Hello")),
                    DataColumn(label: Text("Po"))
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text("Pi")),
                      DataCell(Text("2")),
                    ]),
                  ],
                ),
                MySwitch(),
                const AnimatedWidget(),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 100.0,
                  child: const Card(
                    color: Colors.white,
                    child: Text(
                      'Buenas noches',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                MyRadioGroup(),
                const Placeholder(
                  child: SizedBox(height: 30.0, width: 30.0),
                  color: Colors.green,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Escribe cualquier cosa',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Clic aquí'),
                ),
                const ExpansionTile(
                  title: Text('Escoge si o no'),
                  children: [
                    ListTile(
                      title: Text('Si'),
                    ),
                    ListTile(
                      title: Text('No'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Image.asset(
                        'images/1.jpeg',
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://picsum.photos/250?image=9',
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch(
        value: switchValue,
        onChanged: (bool value) {
          setState(() {
            switchValue = value;
          });
          if (value) {
          } else {
          }
        },
      ),
    );
  }
}

class MyRadioGroup extends StatefulWidget {
  @override
  _MyRadioGroupState createState() => _MyRadioGroupState();
}

class _MyRadioGroupState extends State<MyRadioGroup> {
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Radio<int>(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
              Text('Opción 1'),
            ],
          ),
          Row(
            children: [
              Radio<int>(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
              Text('Opción 2'),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedWidget extends StatefulWidget {
  const AnimatedWidget({Key? key});
  @override
  State<AnimatedWidget> createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.all(50.0),
          height: 200.0,
          color: Colors.red,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: const Icon(Icons.audiotrack, size: 100.0),
          ),
        ),
      ),
    );
  }
}

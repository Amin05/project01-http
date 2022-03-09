import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project01/config/env.dart';
import 'package:project01/models/pegawai.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _jsonContent = "";
  late Future<List<Pegawai>> pegawais;
  final pegawaiListKey = GlobalKey<_HomePageState>();

  @override
  void initState() {
    super.initState();
    pegawais = getListPegawai();
    // _loadSampleJson();
  }

  Future<List<Pegawai>> getListPegawai() async {
    final response = await http.get(Uri.parse("${Env.BASE_URL}/pegawai/all"));

    Map<String, dynamic> parsed = jsonDecode(response.body);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    parsed.forEach((key, value) {
      items.addAll(value);
    });

    List<Pegawai> pegawais = items.map<Pegawai>((json) {
      return Pegawai.fromJson(json);
    }).toList();

    return pegawais;
  }

  Future _loadSampleJson() async {
    final response = await http.get(Uri.parse("${Env.BASE_URL}/pegawai/all"));
    // String jsonString = response.toString();
    final jsonData = json.decode(response.body);
    Pegawai sample = Pegawai.fromJson(jsonData);
    setState(() {
      _jsonContent = sample.toString();
      // sample.name => you can access field from class model
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: pegawaiListKey,
      appBar: AppBar(
        title: Text('Pegawai List'),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       mainAxisSize: MainAxisSize.max,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             RaisedButton(
      //               onPressed: () {
      //                 // TODO: do something in here
      //               },
      //               child: Text("Read JSON File"),
      //             ),
      //           ],
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 12.0),
      //           child: Text(_jsonContent, textAlign: TextAlign.center,),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      body: Center(
        child: FutureBuilder<List<Pegawai>>(
          future: pegawais,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render student lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.nama,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Details(student: data)),
                      // );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (_) {
          //   return Create();
          // }));
        },
      ),
    );
  }
}

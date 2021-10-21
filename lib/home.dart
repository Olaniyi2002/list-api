import 'package:flutter/material.dart';
import 'package:list_api/Model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Network network = Network();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: network.fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: Image.network(
                        snapshot.data[index].image,
                      ),
                      title: Text(snapshot.data[index].title),
                    );
                  });
            } else if (snapshot.hasError) {
              return AlertDialog(
                title: Text('${snapshot.error}'),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

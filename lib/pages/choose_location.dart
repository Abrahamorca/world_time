import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    // simulate a network request for a username
    await Future.delayed(const Duration(seconds: 3), () {
      print('yoshi');
    });

    print('Statement');
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {

          });
        },
        child: const Text('counter is '),
      ),
    );
  }
}

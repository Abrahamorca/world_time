import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    String bgImage = 'night.png';
    Color bgColor = Colors.indigo[700] as Color;

    data =  ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background
    if (data['isDayTime']) {

      bgImage = 'day.png';
      bgColor = Colors.blue;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: const TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

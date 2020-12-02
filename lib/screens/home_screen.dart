import 'package:flutter/material.dart';
import 'package:found_and_lost_app/widgets/backgrounds/background_four.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundFour(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,

            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String user = 'Alvaro Alva Chipana';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 71, 118, 1),
        title: Text(user),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        actions: [
          Image.asset(
            'assets/03.png',
            width: 50,
            height: 40,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

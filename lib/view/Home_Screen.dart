import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPrefrences = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              userPrefrences.removerUser().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: const Text('HomeScreen')),
      ),
    );
  }
}

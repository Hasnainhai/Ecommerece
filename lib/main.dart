import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:ecommerece/view_model/service/home_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => HomeViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => AuthViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => UserViewModel(),
            ),
            ChangeNotifierProvider(create: (_) => HomeRepositoryProvider()),
          ],
          child: const MyApp(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
    // MultiProvider(
    //   providers: [
    //     //  ChangeNotifierProvider(
    //     //   create: (_) => SplashView(),
    //     // ),
    //     ChangeNotifierProvider(
    //       create: (_) => AuthViewModel(),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (_) => UserViewModel(),
    //     ),
    //   ],
    // child:
  }
}

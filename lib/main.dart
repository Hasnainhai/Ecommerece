import 'package:ecommerece/repository/home_ui_repository.dart';
import 'package:ecommerece/repository/preloved_ui_repository.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
import 'package:ecommerece/view_model/preloved_view_model.dart';
import 'package:ecommerece/view_model/service/all_product_view_model.dart';
import 'package:ecommerece/view_model/service/cart_view_model.dart';
import 'package:ecommerece/view_model/service/new_items_view_model.dart';
import 'package:ecommerece/view_model/service/product_details_view_model.dart';
import 'package:ecommerece/view_model/service/save_product_view_model.dart';
import 'package:ecommerece/view_model/service/shop_product_view.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/user_view_model.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
              create: (_) => AuthViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => UserViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => HomeRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => NewItemsViewModel(),
            ),
            ChangeNotifierProvider(
              create: (_) => PrelovedRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProductDetailsRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => ShopProductRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => HomeUiSwithchRepository(),
            ),
            ChangeNotifierProvider(
              create: (_) => CartRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => AllProductsRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => SaveProductRepositoryProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => PrelovedUiRepository(),
            ),
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

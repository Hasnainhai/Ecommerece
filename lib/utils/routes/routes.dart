import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Account/forget_pawword.view.dart';

import 'package:ecommerece/view/Account/loginorsigin_view.dart';
import 'package:ecommerece/view/Account/select_account_type_view.dart';
import 'package:ecommerece/view/Account/siginup_view.dart';
import 'package:ecommerece/view/Home/Bidding/bidding_view.dart';
import 'package:ecommerece/view/Home/CheckOut/Widgets/payment_done.dart';
import 'package:ecommerece/view/Home/CheckOut/checkout_view.dart';
import 'package:ecommerece/view/Home/MyAddress/my_address_view.dart';
import 'package:ecommerece/view/Home/Notification/notification_view.dart';
import 'package:ecommerece/view/Home/PreLovedProductDetail/preloved-product_detail_view.dart';
import 'package:ecommerece/view/Home/Review/review_view.dart';
import 'package:ecommerece/view/Home/Review/total_review.dart';
import 'package:ecommerece/view/Home/WishList/wishlist_view.dart';
import 'package:ecommerece/view/Home/cart/cartScreen.dart';
import 'package:ecommerece/view/Home/dashboard/dashboardScreen.dart';
import 'package:ecommerece/view/Home/new_items/new_items.dart';
import 'package:ecommerece/view/Home/populars/popular_packs.dart';
import 'package:ecommerece/view/Home/save/Widgets/favouriteScreen.dart';
import 'package:ecommerece/view/Home/pro_loved/pre_love_screen.dart';
import 'package:ecommerece/view/Home/profile/profileScreen.dart';
import 'package:ecommerece/view/Orders/myorder_history.dart';
import 'package:ecommerece/view/Orders/myorders.dart';
import 'package:ecommerece/view/chats/chat_screen.dart';
import 'package:ecommerece/view/store/store.dart';
import 'package:ecommerece/view/Onboardings/onboarding1.dart';
import 'package:ecommerece/view/Onboardings/onboarding3.dart';
import 'package:ecommerece/view/Onboardings/onbording2.dart';
import 'package:flutter/material.dart';

import '../../view/Home/Home_Screen.dart';
import '../../view/Account/Login_view.dart';
import '../../view/splashView.dart';
import '../../view/store/visit_store.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());
      case RoutesName.onboarding1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBordingScreen1());
      case RoutesName.onboarding2:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBordingScreen2());
      case RoutesName.onboarding3:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBordingScreen3());
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashBoardScreen());
      case RoutesName.selectaccounttype:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SelectAccountType(),
        );
      case RoutesName.storeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const StoreScreen());
      case RoutesName.preLove:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PreLoveScreen());
      case RoutesName.cartScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CartScreen());
      case RoutesName.favouriteScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FavouriteScreen());
      case RoutesName.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfileScreen());

      case RoutesName.loginorsigin:
        return MaterialPageRoute(builder: (c) => const LoginOrSignUp());
      case RoutesName.forgetpassword:
        return MaterialPageRoute(
          builder: (c) => const ForgetPasswordView(),
        );
      case RoutesName.popularsScreen:
        final List<Products> topProducts = settings.arguments as List<Products>;

        return MaterialPageRoute(
          builder: (c) => PopularsScreen(
            productsTopOrder: topProducts,
          ),
        );
      case RoutesName.newItemsScreen:
        final List<Products> newProducts = settings.arguments as List<Products>;
        return MaterialPageRoute(
          builder: (context) => NewItemsScreem(newProducts: newProducts),
        );

      // case RoutesName.productdetail:
      //   return MaterialPageRoute(
      //     builder: (c) {
      //       final String productId =

      //       return ProductDetailView(productId: productId);
      //     },
      // );
      case RoutesName.preLovedproductdetail:
        return MaterialPageRoute(
          builder: (c) => const PreLovedProductDetailView(),
        );
      case RoutesName.checkout:
        return MaterialPageRoute(
          builder: (c) => const CheckOutView(),
        );
      case RoutesName.visitStore:
        final Map<String, dynamic>? arguments =
            settings.arguments as Map<String, dynamic>?;

        if (arguments != null) {
          final String storeName = arguments['storeName'] ?? '';
          final String totalRating = arguments['totalRating'] ?? '';
          final String description = arguments['description'] ?? '';
          final String id = arguments['id'] ?? '';

          return MaterialPageRoute(
            builder: (c) => VisitStore(
              storeName: storeName,
              totalRating: totalRating,
              description: description,
              id: id,
            ),
          );
        } else {
          return MaterialPageRoute(builder: (c) => const DashBoardScreen());
        }

      case RoutesName.myOrders:
        return MaterialPageRoute(
          builder: (c) => const MyOrders(),
        );
      case RoutesName.paymentdone:
        return MaterialPageRoute(
          builder: (c) => const CheckOutDoneScreen(),
        );
      case RoutesName.myaddress:
        return MaterialPageRoute(
          builder: (c) => const MyAddressView(),
        );
      case RoutesName.biddingrequest:
        return MaterialPageRoute(
          builder: (c) => const BiddingView(),
        );
      case RoutesName.wishlist:
        return MaterialPageRoute(
          builder: (c) => const WishListView(),
        );
      case RoutesName.notification:
        return MaterialPageRoute(
          builder: (c) => const NotificationView(),
        );
      case RoutesName.totalreview:
        return MaterialPageRoute(
          builder: (c) => const TotalReveiw(),
        );
      case RoutesName.rating:
        return MaterialPageRoute(
          builder: (c) => const Rating(),
        );
      case RoutesName.myOrderHistory:
        return MaterialPageRoute(
          builder: (c) => const MyOrderHistory(),
        );
      case RoutesName.chatScreen:
        return MaterialPageRoute(
          builder: (c) => const ChatScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes define'),
            ),
          );
        });
    }
  }
}

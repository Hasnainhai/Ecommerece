import 'package:ecommerece/data/response/status.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/view_model/home_view_model.dart';
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
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.fetchAllProdApi();
  }

  @override
  Widget build(BuildContext context) {
    // final userPrefrences = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Text('home.....'),
      ),
    );
  }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: InkWell(
    //         onTap: () {
    //           userPrefrences.removerUser().then((value) {
    //             Navigator.pushNamed(context, RoutesName.login);
    //           });
    //         },
    //         child: const Center(
    //             child: Text(
    //           'LogOut',
    //         ))),
    //   ),
    //   body: ChangeNotifierProvider(
    //     create: (BuildContext context) => homeViewModel,
    //     child: Consumer<HomeViewModel>(builder: (context, value, _) {
    //       switch (value.allProd.status) {
    //         case Status.LOADING:
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         case Status.ERROR:
    //           return Center(child: Text(value.allProd.message.toString()));
    //         case Status.COMPLETED:
    //           return ListView.builder(
    //               itemCount: value.allProd.data!.allProducts.length,
    //               itemBuilder: (context, index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.all(5.0),
    //                   child: Card(
    //                     child: ListTile(
    //                       leading: Image.network(
    //                         value
    //                             .allProd.data!.allProducts[index].thumbnailImage
    //                             .toString(),
    //                         errorBuilder: (context, error, stack) {
    //                           return const Center(
    //                             child: Icon(
    //                               Icons.error,
    //                               color: AppColor.errorColor,
    //                             ),
    //                           );
    //                         },
    //                       ),
    //                       title: Text(value
    //                           .allProd.data!.allProducts[index].title
    //                           .toString()),
    //                       subtitle: Text(value
    //                           .allProd.data!.allProducts[index].slug
    //                           .toString()),
    //                       trailing: Column(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Text(value.allProd.data!.allProducts[index].price
    //                               .toString()),
    //                           Text(value
    //                               .allProd.data!.allProducts[index].discount
    //                               .toString()),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               });

    //         default:
    //       }
    //       return Container();
    //     }),
    //   ),
    // );
  
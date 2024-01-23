import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:flutter/material.dart';

import 'pro_loved/Widgets/pro_loved_card.dart';
import 'widgets/storeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeViewModel homeViewModel = HomeViewModel();
  // @override
  // void initState() {
  //   super.initState();
  //   homeViewModel.fetchAllProdApi();
  // }

  @override
  Widget build(BuildContext context) {
    // final userPrefrences = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpeacing(20.0),
              ListTile(
                horizontalTitleGap: 16.0,
                leading: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/474x/e7/a9/4b/e7a94b352d281a23d847a13352be652c.jpg',
                      scale: 0.1),
                ),
                title: const Text(
                  'Wellcome',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: AppColor.fontColor,
                      fontFamily: 'CenturyGothic'),
                ),
                subtitle: const Text(
                  'Rayees khan',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontColor,
                      fontFamily: 'CenturyGothic'),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_rounded,
                      color: AppColor.blackColor,
                      size: 30.0,
                    )),
              ),
              const VerticalSpeacing(27.0),
              SizedBox(
                height: 60,
                width: (MediaQuery.of(context).size.width) - 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Search Here",
                      helperStyle: TextStyle(color: AppColor.fieldBgColor),
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      suffixIcon: Icon(
                        Icons.tune_sharp,
                        color: AppColor.fontColor,
                      )),
                ),
              ),
              const VerticalSpeacing(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Store',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.shopScreen);
                    },
                    child: Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'CenturyGothic',
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(13.0),
              const StoreWidget(),
              const VerticalSpeacing(13.0),
              const StoreWidget(),
              const VerticalSpeacing(16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'see more',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'CenturyGothic',
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const VerticalSpeacing(16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCart('All'),
                    CategoryCart('Jakits'),
                    CategoryCart('Shirt'),
                    CategoryCart('Woman'),
                    CategoryCart('Jakits'),
                    CategoryCart('Shirt'),
                    CategoryCart('Woman'),
                  ],
                ),
              ),
              const VerticalSpeacing(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Populars',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.popularsScreen);
                    },
                    child: const Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'CenturyGothic',
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(16.0),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const ProLovedCard();
                  },
                ),
              ),
              const VerticalSpeacing(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Our new items',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'CenturyGothic',
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.newItemsScreen);
                    },
                    child: const Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'CenturyGothic',
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const ProLovedCard();
                  },
                ),
              ),
              const VerticalSpeacing(30.0),
            ],
          ),
        ],
      ),
    )));
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
  
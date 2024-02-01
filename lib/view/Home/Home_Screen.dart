import 'package:ecommerece/model/home_prod_model.dart';
import 'package:ecommerece/res/components/colors.dart';
import 'package:ecommerece/res/components/verticalSpacing.dart';
import 'package:ecommerece/utils/routes/routes_name.dart';
import 'package:ecommerece/view/Home/widgets/categoryWidget.dart';
import 'package:ecommerece/view/filters/filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';
import 'pro_loved/Widgets/pro_loved_card.dart';
import 'widgets/storeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeRepositoryProvider>(context, listen: false).getHomeProd(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                leading: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.profile,
                    );
                  },
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/474x/e7/a9/4b/e7a94b352d281a23d847a13352be652c.jpg',
                        scale: 0.1),
                  ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.notification);
                    },
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
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    helperStyle: const TextStyle(color: AppColor.fieldBgColor),
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FilterPopUp()));
                      },
                      icon: const Icon(
                        Icons.tune_sharp,
                        color: AppColor.fontColor,
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpeacing(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
                      Navigator.pushNamed(context, RoutesName.storeScreen);
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
              Consumer<HomeRepositoryProvider>(
                builder: (context, homeRepo, child) {
                  List<Products> newProducts =
                      homeRepo.homeRepository.productsTopOrder;

                  return Row(
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
                          Navigator.pushNamed(
                            context,
                            RoutesName.popularsScreen,
                            arguments: newProducts,
                          );
                        },
                        child: const Text(
                          'see more',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'CenturyGothic',
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     const Text(
              //       'Populars',
              //       style: TextStyle(
              //         fontSize: 18.0,
              //         fontFamily: 'CenturyGothic',
              //         color: AppColor.fontColor,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, RoutesName.popularsScreen);
              //       },
              //       child: const Text(
              //         'see more',
              //         style: TextStyle(
              //           fontSize: 14.0,
              //           fontFamily: 'CenturyGothic',
              //           color: AppColor.fontColor,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const VerticalSpeacing(
                12,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Consumer<HomeRepositoryProvider>(
                  builder: (context, homeRepo, child) {
                    if (homeRepo.homeRepository.productsTopRated.isEmpty) {
                      return
                          // const Center(
                          //   child: Text(
                          //     'No Products to show',
                          //     style: TextStyle(
                          //       fontSize: 14.0,
                          //       fontFamily: 'CenturyGothic',
                          //       color: AppColor.fontColor,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // );
                          const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeRepo.homeRepository.newProducts.length,
                        itemExtent: MediaQuery.of(context).size.width / 2.2,
                        itemBuilder: (BuildContext context, int index) {
                          Products product =
                              homeRepo.homeRepository.productsTopRated[index];

                          return ProLovedCard(
                            fun: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.productdetail,
                              );
                            },
                            name: product.title,
                            rating: product.averageReview,
                            price: product.price,
                            discount: product.discount.toString(),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              const VerticalSpeacing(20.0),
              Consumer<HomeRepositoryProvider>(
                builder: (context, homeRepo, child) {
                  List<Products> newProducts =
                      homeRepo.homeRepository.newProducts;

                  return Row(
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
                          Navigator.pushNamed(
                            context,
                            RoutesName.newItemsScreen,
                            arguments: newProducts,
                          );
                        },
                        child: const Text(
                          'see more',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'CenturyGothic',
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const VerticalSpeacing(
                12,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Consumer<HomeRepositoryProvider>(
                  builder: (context, homeRepo, child) {
                    if (homeRepo.homeRepository.newProducts.isEmpty) {
                      return
                          // const Center(
                          //   child: Text(
                          //     'No Products to show',
                          //     style: TextStyle(
                          //       fontSize: 14.0,
                          //       fontFamily: 'CenturyGothic',
                          //       color: AppColor.fontColor,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // );
                          const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeRepo.homeRepository.newProducts.length,
                        itemExtent: MediaQuery.of(context).size.width / 2.2,
                        itemBuilder: (BuildContext context, int index) {
                          Products product =
                              homeRepo.homeRepository.newProducts[index];

                          return ProLovedCard(
                            fun: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.productdetail,
                              );
                            },
                            name: product.title,
                            rating: product.averageReview,
                            price: product.price,
                            discount: product.discount.toString(),
                          );
                        },
                      );
                    }
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
  